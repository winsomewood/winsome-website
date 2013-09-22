<?php
$title = "Winsomewood - Replacements";
$includes = array('<link rel="stylesheet" type="text/css" href="replacement.css" />');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Replacements</h2>

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
if (!$_REQUEST['firstname'] || !$_REQUEST['lastname'] || !$_REQUEST['address1'] || !$_REQUEST['city'] || !$_REQUEST['state'] ||
	!$_REQUEST['zip'] || !$_REQUEST['country'] || !$_REQUEST['itemno'] || !$_REQUEST['itemname'] || !$_REQUEST['controlno'] || !$_REQUEST['partno_1']) {
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

# Check for valid e-mail
if ($_REQUEST['email']) {
	if(!preg_match("/^[\w\.%\-]+@[\w.\-]+\.[a-zA-Z]{2,4}$/", $_REQUEST['email']))
	array_push($errors, "e-mail address");
}

if ($errors) {
	$errormessage = implode( ", ", $errors)
?>
			<h3>Request not sent!</h3>
			<p>One or more values is incorrect. Please click the back button and check the following sections: <strong><?= $errormessage ?></strong></p>
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
$subject = 'Online Replacement Request';

$body = array();
foreach($_REQUEST as $key => $value)
	$body[] = $key . ": " . $value;
$body = implode("\n", $body);

$header = "From: {$_REQUEST['contactname']} {$_REQUEST['email']}";
mail($recipient, $subject, $body, $header);

include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>