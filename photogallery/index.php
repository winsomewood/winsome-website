<?php
# $_REQUEST['item'] - item number to display

if (!$_REQUEST['item']) {
	include($_SERVER['DOCUMENT_ROOT'] . "/error.php");
	return;
}

# Assemble $completeimagelist
$dir = opendir($_SERVER['DOCUMENT_ROOT'] . '/images/completeitemimages(200px)');
while ($filename = readdir($dir)) {
	$completeimagelist[] = $filename;
}
sort($completeimagelist);

# Search for children to display pictures
$query = "SELECT itemno
		  FROM kitlist
		  WHERE kitno = " . $_REQUEST['item'];
# Search for category & collection names to display title
$query2 = "SELECT category, collection
		  FROM itemlist
		  WHERE itemno = " . $_REQUEST['item'];
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

$itemnos = array ($_REQUEST['item']);
while ($a = mysql_fetch_array($results)) {
	$itemnos[] = $a[0];
}
$title = mysql_fetch_array($results2);
$title = ($title['collection']) ? $title['category'] . " / " . $title['collection'] : $title[category];

# Find $imagestodisplay in 2 steps
$imagestodisplay = array();
# Step 1 - Step through completeimagelist and look for pictures of the item and its alternate images
foreach ($completeimagelist as $image) {
	if (preg_match("/{$itemnos[0]}.*/", substr($image, 0, 5))) {
		$imagestodisplay[] = $image;
	}
}
# Step 2 - Step through completeimagelist and look for pictures of the item's children
unset($itemnos[0]);
foreach ($completeimagelist as $image) {
	if ($image[5] != "_" && in_array(substr($image, 0, 5), $itemnos)) {
		$imagestodisplay[] = $image;
	}
}
# At this point, imagestodisplay should be sorted as
# 1. Main item image
# 2. Altername images for main item
# 3. Children's main images

# Make sure there are images to display
if ($imagestodisplay == null) {
	include($_SERVER['DOCUMENT_ROOT'] . "/error.php");
	return;
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="shortcut icon" href="/favicon.ico" />
	<script type="text/javascript" src="/helperfiles/prototype.js"></script>
	<link rel="stylesheet" type="text/css" href="photogallery.css" />
	<script type="text/javascript" src="photogallery.js"></script>
	<title>Winsomewood - Photo Gallery - <?= $title ?></title>
</head>
<body>
<?php
if (count($imagestodisplay) > 1) {
?>
<div id="sidebar">
<?php
	for ($i = 0; $i < count($imagestodisplay); $i++) {
?>
	<div><img src="/images/completeitemimages(200px)/<?= $imagestodisplay[$i] ?>" alt="" /></div>
<?php
	}
?>
</div>
<?php
}
?>
<div id="maindiv">
	<h2 id="description"></h2>
	<h3 id="subtitle"></h3>
	<div id="imagediv">
		<img id="mainimage" src="/images/completeitemimages(584px)/<?= $imagestodisplay[0] ?>" alt="" />
	</div>
</div>

<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/analytics.html");
?>

</body>
</html>