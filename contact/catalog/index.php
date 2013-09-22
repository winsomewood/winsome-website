<?php
$title = "Winsomewood - Contact Us - Catalog Request";
$includes = array(
	'<link rel="stylesheet" type="text/css" href="catalog.css" />',
	'<script type="text/javascript" src="catalog.js"></script>');
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/header.php");
?>
	<h2 id="title">Catalog Request</h2>
	
	<div id="content">
		<p>Please submit the following information so we may send you a catalog.</p>
		<form id="request" action="request.php" method="post">
			<fieldset>
				<legend>Shipping Address (Required)</legend>
				<div><label>Company Name: <input type="text" name="companyname" id="companyname" /></label></div>
				<div><label>Address 1: <input type="text" name="address1" id="address1" /></label></div>
				<div><label>Address 2: <input type="text" name="address2" id="address2" /></label></div>
				<div><label>City: <input type="text" name="city" id="city" /></label></div>
				<div><label>State/Province:
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
				<div><label>Zip/Postal Code: <input type="text" name="zip" id="zip"/></label></div>
				<div><label>Country:
					<select name="country" id="country">
						<option>US</option>
						<option>Canada</option>
					</select>
				</label></div>
				<div><label>Phone Number: <input type="text" name="phone" id="phone"/></label></div>
			</fieldset>
			<fieldset>
				<legend>Contact Information (Optional)</legend>
				<div><label>Contact Name: <input type="text" name="contactname" id="contactname" /></label></div>
				<div><label>Contact Email: <input type="text" name="email" id="email" /></label></div>
			</fieldset>
			<fieldset>
				<legend>Verification (Required)</legend>
				<div><label>Resale Number: <input type="text" name="resale" id="resale" /></label></div>
			</fieldset>
			<fieldset>
				<legend>Products of Interest / Comments (Optional)</legend>
				<p id="textareaparagraph"><textarea name="comments" rows="2" cols="20"></textarea></p>
			</fieldset>
			<fieldset id="submitdiv">
				<input type="submit" value="Submit Request" />
			</fieldset>
		</form>
		<p id="warning"></p>
	</div>
<?php
include($_SERVER['DOCUMENT_ROOT'] . "/helperfiles/footer.php");
?>