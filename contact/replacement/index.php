<?php
$title = "Winsomewood - Contact Us - Replacements";
$includes = array(
	'<link rel="stylesheet" type="text/css" href="replacement.css" />',
	'<script type="text/javascript" src="replacement.js"></script>');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Replacements</h2>
	
	<div id="content">
		<p>Please submit the following information to request replacement parts.</p>
		<h3>Notice</h3>
		<ul>
			<li>Replacements are provided free of charge within 60 days of the date of purchase</li>
			<li>Item must have been purchased from an authorized dealer</li>
			<li>If you need parts for more than one model, please fill out a separate form for each model</li>
		</ul>
		<p id="required">* = Required</p>
		<form id="request" action="request.php" method="post">
			<fieldset>
				<legend>Contact Information</legend>
				<div><label>* First Name: <input type="text" name="firstname" id="firstname" /></label></div>
				<div><label>* Last Name: <input type="text" name="lastname" id="lastname" /></label></div>
				<div><label>* Address 1: <input type="text" name="address1" id="address1" /></label></div>
				<div><label>Address 2: <input type="text" name="address2" id="address2" /></label></div>
				<div><label>* City: <input type="text" name="city" id="city" /></label></div>
				<div><label>* State/Province:
					<select name="state" id="state">
						<optgroup label="US States">
<?php
$states = array(
'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut',
'Delaware', 'District of Columbia', 'Florida ', 'Georgia', 'Hawaii', 'Idaho',
'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana',
'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York',
'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania',
'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah',
'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming');

foreach($states as $state) {
?>
							<option><?= $state ?></option>
<?php
}
?>
						</optgroup>
						<optgroup label="Canada Provinces">
<?php

$provinces = array(
'Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland and Labrador',
'Nova Scotia', 'Ontario', 'Prince Edward Island', 'Quebec', 'Saskatchewan');
foreach($provinces as $province) {
?>
							<option><?= $province ?></option>
<?php
}
?>
						</optgroup>
						<optgroup label="Canada Territories">
<?php
$territories = array('Northwest Territories', 'Nunavut', 'Yukon Territory');
foreach($territories as $territory) {
?>
							<option><?= $territory ?></option>
<?php
}
?>
						</optgroup>
					</select>
				</label></div>
				<div><label>* Zip/Postal Code: <input type="text" name="zip" id="zip"/></label></div>
				<div><label>* Country:
					<select name="country" id="country">
						<option>US</option>
						<option>Canada</option>
					</select>
				</label></div>
				<div><label>* E-mail: <input type="text" name="email" id="email"/></label></div>
			</fieldset>
			<fieldset>
				<legend>Purchase Information</legend>
				<div><label>* Purchase Date: <input type="text" name="purchasedate" id="purchasedate" /></label></div>
				<div><label>* Purchased From: <input type="text" name="purchasedfrom" id="purchasedfrom" /></label></div>
				<div><label>* Purchase Receipt #: <input type="text" name="purchasereceipt" id="purchasereceipt" /></label></div>
			</fieldset>
			<fieldset>
				<legend>Product Information</legend>
				<div><label>* Winsome Item # (5-digit): <input type="text" name="itemno" id="itemno" maxlength="5" /></label></div>
				<div><label>* Product Name: <input type="text" name="itemname" id="itemname" /></label></div>
				<div><label>* Control # (6-digit): <input type="text" name="controlno" id="controlno" maxlength="6" /></label></div>
				<span class="tip">All product information can be found on the cover page of the assembly instructions or on the carton</span>
			</fieldset>
			<fieldset id="partsNeeded">
				<legend>Parts Needed</legend>
				<div id="addRow"><img id="addRowImg" src="../../images/plus.png">Add row</div>
				<div><label>Reason for replacement:
					<select name="reason" id="reason">
						<option>Missing</option>
						<option>Defective</option>
						<option>Other</option>
					</select>
				</label></div>
				<label>If other, please explain:<p id="textareaparagraph"><textarea name="other_explanation" rows="2" cols="20"></textarea></p></label>
			</fieldset>
			<fieldset id="submitdiv">
				<input type="submit" value="Submit Request" />
			</fieldset>
		</form>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>