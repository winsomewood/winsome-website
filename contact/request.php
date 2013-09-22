<?php
$title = "Winsomewood - Contact us";
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Contact Us</h2>
	
	<div id="content">
		<div class="roundedcornerwrapper">
			<div class="top"></div>
			<div class="roundedcornerinner">
				<h3>Thank you for your request!</h3>
				<p>Click <a href="javascript:history.go(-2)">here</a> to return to the page you were viewing.</p>
			</div>
			<div class="bottom"></div>
			<div class="spacer"></div>
		</div>
	</div>
<?php
$recipient = 'info@winsomewood.com';
$subject = 'Online Comment Form';
$body = "Name: {$_REQUEST['name']}\n" .
"E-mail: {$_REQUEST['email']}\n" .
"Comments: {$_REQUEST['comments']}";

$header = "From: {$_REQUEST['name']} {$_REQUEST['email']}";
mail($recipient, $subject, $body, $header);

include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>