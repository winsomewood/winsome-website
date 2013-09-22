<?php
$title = "Winsomewood - Products by Item No.";
$scroll = true;
$includes = array ('<link rel="stylesheet" type="text/css" href="itemno.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Products by Item No.</h2>

	<div id="content">
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/productnav.php");
$ITEMS_PER_PAGE = 25;
$pagelinksquery = "?";
$directory = opendir($_SERVER['DOCUMENT_ROOT'] . '/images/completeitemimages(200px)');
while ($image = readdir($directory)) {
	$completeimagelist[] = $image;
}
sort($completeimagelist);
closedir($directory);

$query = "SELECT COUNT(*) from itemlist";
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");
$totalitemcount = mysql_fetch_array($results);
if ($_REQUEST["page"] < 1 || $_REQUEST["page"] > $totalitemcount[0] / $ITEMS_PER_PAGE + 1) {
	$page = 1;
}
else {
	$page = $_REQUEST["page"];
}

$query = "SELECT itemno, kit, upc, description, length, width, height
		  FROM   itemlist
          ORDER BY itemno
		  LIMIT  " . ($page * $ITEMS_PER_PAGE - $ITEMS_PER_PAGE) . ", " . $ITEMS_PER_PAGE;

include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

# Workaround to avoid query clashes
$query = "";

include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/pagelinks.php");
?>
		<table>

			<tr>
				<th></th>
				<th>Item No.</th>
				<th>UPC Barcode</th>
				<th>Description</th>
				<th>Dimensions (in.)<br />
					W x D x H</th>
			</tr>
<?php

while ($item = mysql_fetch_array($results)) {
	$imagesrc = "";
	# Find a matching image
	foreach ($completeimagelist as $img) {
		if (preg_match("/{$item['itemno']}.*/", $img)) {
			$imagesrc = $img;
			break;
		}
	}
?>
			<tr onclick="location.href='/productgallery/?item=<?= $item[0] ?>';" onmouseover="$(this).addClassName('highlighted')" onmouseout="removeClassName('highlighted')">
				<td class="productimagecell">
<?php
	if ($imagesrc) {
?>
					<img src="/images/completeitemimages(200px)/<?= $imagesrc ?>" alt="" />
<?php
	}
	else {
?>
					<img src="/images/unavailable.jpg" alt="No picture available" />
<?php
	}
?>
				</td>
				<td><?= $item['itemno'] ?></td> <!-- Item No. -->
				<td><?= $item['upc'] ?></td> <!-- UPC Barcode -->
				<td><?= str_replace("&", "&amp;", $item['description']) ?></td> <!-- Description -->
<?php
	if ($item['kit']) { # If item is a kit so query for child's largest dimension
		$query2 = "SELECT length, width, height
				  FROM kitlist, itemlist
				  WHERE kitlist.itemno = itemlist.itemno
				  AND kitno = {$item['itemno']}
				  LIMIT 1";
		include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

		$item = mysql_fetch_array($results2);
	}
?>
				<td><?php echo ($item['length'] != 0) ? $item['length'] . " x " . $item['width'] . " x " . $item['height'] : "N/A"?></td> <!-- Dimensions (W x D x H) -->
			</tr>
<?php
}
?>
		</table>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/pagelinks.php");
?>
		</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>
