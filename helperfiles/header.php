<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link rel="shortcut icon" href="/favicon.ico" />
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" type="text/css" href="/winsomewood.css" />
	<script type="text/javascript" src="/helperfiles/prototype.js"></script>
	<script type="text/javascript">
		if (screen.width > 1280) {
			$$("html")[0].style.backgroundImage = "url(/images/backgroundBig.jpg)";
		}
		else {
			$$("html")[0].style.backgroundImage = "url(/images/backgroundSmall.jpg)";
		}
	</script>
<?php
# $includes - text string containing the file to include in the HTML document
# $title - text string of the page title
if ($includes) {
	foreach ($includes as $include) {
		echo "\t$include\n";
	}
}
?>
	<title><?= $title ?></title>
</head>
<body>
<h1 id="banner"><a href="/"><img src="/images/banner.gif" alt="Winsome" /></a></h1>

<div id="menuwrapper">
	<div id="menu">
		<a href="/" <?php $text = ($title == "Winsomewood") ? 'class="current"' : ""; echo $text ?>>Home</a>
		<a href="/products/category/" <?php $text = (strstr($title, "Product") != false) ? 'class="current"' : ""; echo $text;?>>Product</a>
		<a href="/find/" <?php $text = ($title == "Winsomewood - Find us") ? 'class="current"' : ""; echo $text;?>>Find us</a>
		<a href="/about/" <?php $text = ($title == "Winsomewood - About us") ? 'class="current"' : ""; echo $text;?>>About us</a>
		<a href="/contact/" <?php $text = (strstr($title, "Contact")) ? 'class="current"' : ""; echo $text;?>>Contact us</a>
	</div>
</div>
