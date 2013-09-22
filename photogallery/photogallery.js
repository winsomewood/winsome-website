window.onload = function() {
	var imagelinks = $$("#sidebar div");
	for (var i = 0; i < imagelinks.length; i++) {
		imagelinks[i].onclick = changeImage;
	}
	changeDescription1($("mainimage").src);
	if ($("sidebar") == null)
		$("maindiv").style.width = "100%";
}

function changeImage() {
	var newimagesrc = this.childElements()[0].src.replace(/200px/, "584px");
	$("mainimage").src = newimagesrc;
	changeDescription1(newimagesrc);
}

function changeDescription1(newimagesrc) {
	var subtitle = newimagesrc.substring(newimagesrc.lastIndexOf("/") + 6, newimagesrc.lastIndexOf("."));
	
	// Remove item number from description
	if (subtitle.indexOf("_") != -1) {
		subtitle = subtitle.substring(subtitle.indexOf("_") + 1);
	}
	
	// Remove collection name from description
	if (subtitle.indexOf("-") != -1) {
		subtitle = subtitle.substring(0, subtitle.lastIndexOf("-"));
	}
	
	// Add space between two uppercase letters
	subtitle = subtitle.replace(/([a-z])([A-Z])/g, "$1 $2");
	
	// Replace underscore with comma
	subtitle = subtitle.replace(/_/g, ", ");
	
	// Add spaces around parens
	subtitle = subtitle.replace(/\(/g, " (");
	subtitle = subtitle.replace(/\)/g, ") ");
	
	$("subtitle").innerText = $("subtitle").textContent = subtitle;
	
	new Ajax.Request(
	"photogallery.php",
		{
			method: "POST",
			parameters: { "item": newimagesrc.substring(newimagesrc.lastIndexOf("/") + 1, newimagesrc.lastIndexOf("/") + 6) },
			onSuccess: changeDescription2
		}
	);
}

function changeDescription2(ajax) {
	$("description").innerHTML = $("description").textContent = ajax.responseText;
}
