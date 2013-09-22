window.onload = function() {
	$("request").onsubmit = validate;
	document.body.onclick = clearMessage;
};

function validate(e) {
	var errors = [];
	// Separate and add error borders
	if (!$("companyname").value || !$("address1").value || !$("city").value || !$("state").value ||
		!$("zip").value || !$("phone").value || !$("resale").value) {
		errors.push("One of the required fields is blank.");
	}
	
	if ($("zip").value && !$("zip").value.match(/^\d{5}-?(\d{4})?$/)) {
		errors.push("The zip code you entered is invalid.");
	}
	if ($("phone").value && !$("phone").value.match(/^.?\d{3}.{0,2}\d{3}.?\d{4}$/)) {
		errors.push("The phone number you entered is invalid.");
	}
	if ($("email").value && !$("email").value.match(/^[\w\.%\-]+@[\w.\-]+\.[a-zA-Z]{2,4}$/)) {
		errors.push("The e-mail address you entered is invalid.");
	}
	
	if (errors.length) {
		Event.stop(e);
		$("warning").textContent = errors.join(" ");
	}
}

function clearMessage() {
	$("warning").textContent = "";
}