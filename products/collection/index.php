<?php
$title = "Winsomewood - Products by Collection";
$includes = array ('<link rel="stylesheet" type="text/css" href="collection.css" />',
				   '<script type="text/javascript" src="collection.js"></script>');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Products by Collection</h2>
	
	<div id="content">
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/productnav.php");
?>		
		<p>Click image to view individual items</p>
		<div id="collectionlinks">
		
<?php

$query = "SELECT DISTINCT collection FROM itemlist WHERE collection <> '' ORDER BY collection";
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

$firstcollection = mysql_fetch_array($results);
?>
				<span><?= $firstcollection['collection'] ?></span>
<?php
while ($collection = mysql_fetch_array($results)) {
?>
				<a href="javascript:void(0)"><?= $collection['collection'] ?></a>
<?php
}
?>
		</div>
		<div id="collectionimagediv">
			<a href="/productgallery?collection=<?= $firstcollection['collection'] ?>">
				<h3 class="cursive" id="collectiontitle"><?= $firstcollection['collection'] ?></h3>
				<img id="collectionimage" src="/images/collectionimages/<?= $firstcollection['collection'] ?>.jpg" alt="<?= $firstcollection['collection'] ?>" />
			</a>
		</div>
		<div class="spacer"></div>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>