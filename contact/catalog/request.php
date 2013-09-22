<?php
$title = "Winsomewood - Catalog Request";
$includes = array('<link rel="stylesheet" type="text/css" href="catalog.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
<h2 id="title">Catalog Request</h2>

<div id="content">
	<div class="roundedcornerwrapper">
		<div class="top"></div>
		<div class="roundedcornerinner">
<?php
###############
# Error Checking
###############
$errors = array();
# Check blank required submissions
if (!$_REQUEST['companyname'] || !$_REQUEST['address1'] || !$_REQUEST['city'] || !$_REQUEST['state'] ||
	!$_REQUEST['zip'] || !$_REQUEST['country'] || !$_REQUEST['phone'] || !$_REQUEST['resale']) {
?>
			<h3>One or more of the required fields is blank.</h3>
			<p>Please click the back button and review your submission.</p>
		</div>
		<div class="bottom"></div>
		<div class="spacer"></div>
	</div>
</div>
<?php
	include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
	return;
}

# Check for valid zip code
if (!preg_match("/^\d{5}-?(\d{4})?$/", $_REQUEST['zip']))
	array_push($errors, "zip code");

# Check for valid phone number
if (!preg_match("/^.?\d{3}.{0,2}\d{3}.?\d{4}$/", $_REQUEST['phone']))
	array_push($errors, "phone number");

# Check for valid e-mail
if ($_REQUEST['email']) {
	if(!preg_match("/^[\w\.%\-]+@[\w.\-]+\.[a-zA-Z]{2,4}$/", $_REQUEST['email']))
	array_push($errors, "e-mail address");
}

if ($errors) {
	$errormessage = implode( ", ", $errors)
?>
			<h3>Request not sent!</h3>
			<p>One or more values is incorrect. Please click the back button and check the following sections: <?= $errormessage ?></p>
		</div>
		<div class="bottom"></div>
		<div class="spacer"></div>
	</div>
</div>
<?php
	include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
	return;
}

###############
# Everything is correct
###############
?>
			<h3>Thank you for your request!</h3>
			<p>Click <a href="javascript:history.go(-3)">here</a> to return to the page you were viewing.</p>
		</div>
		<div class="bottom"></div>
		<div class="spacer"></div>
	</div>
</div>
<?php
$recipient = 'info@winsomewood.com';
$subject = 'Online Catalog Request';
$body = "Company Name: {$_REQUEST['companyname']}\n" .
"Address 1: {$_REQUEST['address1']}\n" .
"Address 2: {$_REQUEST['address2']}\n" .
"City: {$_REQUEST['city']}\n" .
"State/Province: {$_REQUEST['state']}\n" .
"Zip/Postal Code: {$_REQUEST['zip']}\n" .
"Country: {$_REQUEST['country']}\n" .
"Phone Number: {$_REQUEST['phone']}\n" .
"Contact Name: {$_REQUEST['contactname']}\n" .
"Contact Email: {$_REQUEST['email']}\n" .
"Resale Number: {$_REQUEST['resale']}\n" .
"Products of Interest / Comments: {$_REQUEST['comments']}";

$header = "From: {$_REQUEST['contactname']} {$_REQUEST['email']}";
mail($recipient, $subject, $body, $header);

include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>