<?php
$title = "Winsomewood";
$includes = array('<link rel="stylesheet" type="text/css" href="index.css" />',
				  '<script type="text/javascript" src="/helperfiles/effects.js"></script>',
				  '<script type="text/javascript" src="/slideshow.js"></script>');
include("helperfiles/header.php");
?>
	<div id="title">
		<h2>Welcome</h2>
		<p>Manufacturer and Distributor of Quality Lifestyle Furniture for the home.</p>
	</div>
	<div id="content">
		<div id="slideshowdiv">
			<a href="" id="slideshowlink" >
				<img id="slideshowimg1" src="images/blank.jpg" alt="" />
				<img id="slideshowimg2" src="images/blank.jpg" alt="" />
			</a>
		</div>
	</div>
<?php
include("helperfiles/footer.php");
?>