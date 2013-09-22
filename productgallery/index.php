<?php
# $_REQUEST['category'] - title of category
# $_REQUEST['collection'] - title of collection
# $_REQUEST['page'] - page number
# $_REQUEST['item'] - item number of individual item to be displayed

# Error checking
$query = "SELECT  category FROM itemlist UNION SELECT collection FROM itemlist";
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

while ($a = mysql_fetch_array($results)) {
	$groups[] = $a[0];
}

if (!$_REQUEST['item'] &&
	((!$_REQUEST['category'] && !$_REQUEST['collection']) ||
	(!in_array($_REQUEST['category'], $groups) && !in_array($_REQUEST['collection'], $groups)))) {
	include($_SERVER['DOCUMENT_ROOT'] . "/error.php");
	return;
}
if ($_REQUEST['page'] < 1)
	$page = 1;
else {
	$page = $_REQUEST['page'];
}

if ($_REQUEST['category']) { # Display category
	$group = $_REQUEST['category'];
	$column = "category";
	$pagelinksquery = "?category={$group}&amp;";
}
else if ($_REQUEST['collection']) { # Display collection
	$group = $_REQUEST['collection'];
	$column = "collection";
	$pagelinksquery = "?collection={$group}&amp;";
}
$ITEMS_PER_PAGE = 10;


# Scan text files for which products belong in this category
$directory = opendir($_SERVER['DOCUMENT_ROOT'] . '/images/completeitemimages(200px)');
while ($image = readdir($directory)) {
	$completeimagelist[] = $image;
}
sort($completeimagelist);
closedir($directory);
# $completeimagelist - complete list of images scanned from directory

# $itemstodisplay - list of items that will be displayed on screen
# $imagestodisplay - matching list of images that will be displayed on screen
if ($_REQUEST['category'] || $_REQUEST['collection']) { # Assemble $itemstodisplay for category display
	# Order by description
	$query = "SELECT itemno, kit, upc, description, finish, assembly, length, width, height
			  FROM itemlist
			  WHERE {$column} = '{$group}'
			  ORDER BY description
			  LIMIT  " . ($page * $ITEMS_PER_PAGE - $ITEMS_PER_PAGE) . ", " . $ITEMS_PER_PAGE;

	$query2 = "SELECT COUNT(*)
			  FROM itemlist
			  WHERE {$column} = '{$group}'";
	include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");
}
else { # Assemble $itemstodisplay for individual display
	# Set title
	$query = "SELECT category, collection
			  FROM itemlist
			  WHERE itemno = " . $_REQUEST['item'];
	include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");
	$a = mysql_fetch_array($results);
	$group = ($a['collection']) ? $a['category'] . " / " . $a['collection'] : $a['category'];
	$titleimg = '<img src="/images/titleimages/' . strtolower($a['category']) . '.gif" alt="' . $a['category'] . '" />';

	# Clicked item first then order by item no
	$query = "(SELECT itemno, kit, upc, description, finish, assembly, length, width, height
			  FROM itemlist
			  WHERE {$_REQUEST['item']} = itemno)
			  UNION
			  (SELECT itemno, kit, upc, description, finish, assembly, length, width, height
			  FROM itemlist
			  WHERE itemno IN (SELECT itemno FROM kitlist WHERE kitno = {$_REQUEST['item']}))
			  LIMIT  " . ($page * $ITEMS_PER_PAGE - $ITEMS_PER_PAGE) . ", " . $ITEMS_PER_PAGE;
	$query2 = "SELECT COUNT(*)
			  FROM itemlist
			  WHERE {$_REQUEST['item']} = itemno
			  OR itemno IN (SELECT itemno FROM kitlist WHERE kitno = {$_REQUEST['item']})";
	include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");
}

# Workaround to avoid query clashes
$query = "";
$totalitemcount = mysql_fetch_array($results2);

if ($_REQUEST['category']) {
	$title = "Winsomewood - Products by Category - $group";
}
else if ($_REQUEST['collection']) {
	$title = "Winsomewood - Products by Collection - $group";
}
else if ($_REQUEST['item']) {
	$title = "Winsomewood - Products by Item No. - $group";
}
$scroll = true;
$includes = array ('<link rel="stylesheet" type="text/css" href="items.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title"><?= $group ?></h2>

	<div id="content">
<?
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/productnav.php");
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/pagelinks.php");
?>
		<p>Click image for a closer look<span style="font-size: .9em; float: right">Product dimensions are approximate</span></p>
<?php

# Assemble $imagestodisplay by looping through $itemstodisplay and finding matching images
while ($item = mysql_fetch_array($results)) {
	$imagesrc = "";
	$imagefound = false;
	foreach ($completeimagelist as $img) {
		if (preg_match("/{$item['itemno']}.*/", substr($img, 0, 5))) {
			$imagesrc = $img;
			$imagefound = true;
			break;
		}
	}
?>
		<div class="productdiv roundedcornerwrapper">
			<div class="top"></div>
<?php
	if ($imagefound) {
?>
			<div class="imagediv imagefound">
				<a href="javascript:void(0)" onclick="window.open('/photogallery/?item=<?= $item['itemno'] ?>', 'photogallery', 'width=910, height=660')">
					<img src="/images/completeitemimages(200px)/<?= $imagesrc ?>" alt="" />
				</a>
			</div>
<?php
	}
	else {
		$imagestodisplay[] = "unavailable.jpg";
?>
			<div class="imagediv"><img src="/images/unavailable.jpg" alt="No Picture Available" /></div>
<?php
	}
	# If item is a kit display all items' dimensions
	if ($item['kit']) {
?>

			<div class="descriptiondiv">
				<h3><?= str_replace("&", "&amp;", $item['description']) ?></h3>
				<ul>
					<li><strong>Item #:</strong> <?= $item['itemno'] ?></li>
<?php
		$query2 = "SELECT name, length, width, height
				   FROM kitlist, itemlist
				   WHERE kitlist.itemno = itemlist.itemno
				   AND kitlist.kitno = {$item['itemno']}
				   AND name <> ''";
		include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

		while ($child = mysql_fetch_array($results2)) {
			?>
					<li><strong><?= $child['name'] ?> Dimensions (W x D x H):</strong>
						<ul>
							<li><?= $child['length'] ?> in x <?= $child['width'] ?> in x <?= $child['height'] ?> in</li>
							<li><?= round($child['length'] * 2.54, 1) ?> cm x <?= round($child['width'] * 2.54, 1) ?> cm x <?= round($child['height'] * 2.54, 1) ?> cm</li>
						</ul>
					</li>
			<?php
		}
	}
	else {
?>
			<div class="descriptiondiv nokit">
				<h3><?= str_replace("&", "&amp;", $item['description']) ?></h3>
				<ul>
					<li><strong>Item #:</strong> <?= $item['itemno'] ?></li>
					<li><strong>Product Dimensions (W x D x H):</strong>
						<ul>
							<li><?= $item['length'] ?> in x <?= $item['width'] ?> in x <?= $item['height'] ?> in</li>
							<li><?= round($item['length'] * 2.54, 1) ?> cm x <?= round($item['width'] * 2.54, 1) ?> cm x <?= round($item['height'] * 2.54, 1) ?> cm</li>
						</ul>
					</li>
<?php
	}
?>
				</ul>
				<ul>
					<li><strong>UPC Barcode:</strong> <?= $item['upc'] ?></li>
					<li><strong>Assembly Required:</strong> <?php echo ( $item['assembly'] == true ) ? "Yes" : "No" ?></li>
					<li><strong>Finish:</strong> <?= $item['finish'] ?></li>
				</ul>
			</div>
			<div class="bottom"></div>
			<p class="spacer"></p>
		</div>
<?php
}
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/pagelinks.php");
?>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>
