<?php
$title = "Winsomewood - Products by Category";
$includes = array ('<link rel="stylesheet" type="text/css" href="category.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Products by Category</h2>
	
	<div id="content">
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/productnav.php");
?>		
		<div id="categorylinks">
<?php

$query = "SELECT DISTINCT category FROM itemlist ORDER BY category";
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/query.php");

while ($category = mysql_fetch_array($results)) {
?>
			<div>
				<a href="/productgallery/?category=<?= $category['category'] ?>">
					<img src="/images/categoryimages/<?= strToLower($category['category']) ?>.jpg" alt="" /><br />
					<span><?= $category['category'] ?></span>
				</a>
			</div>
<?php
}
?>
			<p class="spacer"></p>
		</div>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>