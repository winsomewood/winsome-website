<?php
# Implements the "Browse By" navigation bar seen in Product pages.
?>
		<div class="productnav">
<?php
if (strstr($title, "Category") || $_REQUEST['category']) {
?>
			<span>Browse By Category</span>
<?php
}
else {
?>
			<a href="/products/category/">Browse By Category</a>
<?php
}
?>
			<img src="/images/divider.gif" alt=" - " />
<?php
if (strstr($title, "Collection") || $_REQUEST['collection']) {
?>
			<span>Browse By Collection</span>
<?php
}
else {
?>
			<a href="/products/collection/">Browse By Collection</a>
<?php
}
?>
			<img src="/images/divider.gif" alt=" - " />
<?php
if (strstr($title, "Item No.") || $_REQUEST['item']) {
?>
			<span>Browse By Item No.</span>
<?php
}
else {
?>
			<a href="/products/itemno/">Browse By Item No.</a>
<?php
}
?>
		</div>
		<div class="spacer"></div>