<?php
$title = "Winsomewood - Find us";
$includes = array('<link rel="stylesheet" type="text/css" href="find.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Find Us</h2>

	<div id="content">
		<div class="roundedcornerwrapper">
			<div class="top"></div>
			<div class="roundedcornerinner">
				<p>
					Winsome is a wholesaler and does not sell directly to the public.
					Our products are available from our retail partners, please contact the retailers directly.
				</p>
				<div id="links">
<?php
$directory = opendir('../images/companylogos');
while ($company = readdir($directory)) {
	if ($company != "." && $company != "..") {
		$companies[] = $company;
	}
}
closedir($directory);
sort($companies);

$nameToUrl = array("comforthouse" => "http://www.comforthouse.com/winsome.html",
				   "simplyhousewares" => "http://www.simplyhousewares.com/index.php/brands/winsome-wood.html?utm_source=winsome-wood",
				   "shopladder" => "http://www.shopladder.com/Winsome Wood-BR334.htm",
				   "dynamichomedecor" => "http://www.dynamichomedecor.com/Winsome-Wood.html",
				   "visiondecor" => "http://search.visiondecor.com/search.php?keywords=winsome&x=0&y=0",
				   "walmart_CA" => "http://www.walmart.ca/en/furniture/winsome/N-119+1000376",
				   "wayfair" => "http://www.wayfair.com/Winsome-C115456.html",
"hayneedle" => "http://search.hayneedle.com/search/index.cfm?Ntt=winsome",
"allmodern" => "http://www.allmodern.com/Dining-Furniture-C1782585.html",
"wayfairsupply" => "http://www.allmodern.com/Dining-Furniture-C1782585.html",
                   "spacesavers" => "http://www.spacesavers.com/Storage/Winsome-Wood",
                                   "shopfreely" => "http://www.shopfreely.com/Winsome-s/1342.htm",
                                   "lowes-logo" => "http://www.lowes.ca/winsome-wood_m2278.html",
"quill" => "http://www.quill.com/office-furniture-chairs-filing-cabinets/cbu/1.html",
				"123greetings" => "http://store.123greetings.com/furniture.html?brand=959");


foreach ($companies as $companysrc) {
	$companyname = $name = substr($companysrc, 0, strrpos($companysrc, '.'));
	if ($nameToUrl[$companyname]) {
		$url = $nameToUrl[$companyname];
	}
	else {
		$url = "http://www.${companyname}.com/";
	}
?>
				<a href="<?= $url ?>" target="_blank" ><img src="/images/companylogos/<?= $companysrc ?>" alt="<?= $companyname ?>" /></a>
<?php
}
?>
				</div>
			</div>
			<div class="spacer"></div>
			<div class="bottom"></div>
		</div>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>
