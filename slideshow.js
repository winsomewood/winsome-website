var images = [];
var currentimgnum = 0;

window.onload = function() {
	new Ajax.Request(
		"findimages.php",
		{
			method: "post",
			onSuccess: startslideshow
		}
	);
};

function startslideshow(ajax) {
	images = ajax.responseText.split("|");
	$("slideshowimg1").src = "images/collectionimages/" + images[0];
	$("slideshowlink").href = ("productgallery/?collection=" + images[0]).split(".")[0]; // Remove ".jpg"
	slideshow1();
}

// Fade in the next image
function slideshow1() {
	if (currentimgnum % 2) {
		new Effect.Fade("slideshowimg1");
		new Effect.Appear("slideshowimg2");
	}
	else {
		new Effect.Appear("slideshowimg1");
		new Effect.Fade("slideshowimg2");
	}
	// Wait 5 seconds to prepare the next image
	setTimeout(slideshow2, 5000);
}

// Setup next image
function slideshow2() {
	currentimgnum++;
	var currentimg = images[currentimgnum % images.length]
	if (!(currentimgnum % 2)) {
		$("slideshowimg1").src = "images/collectionimages/" + currentimg;
	}
	else {
		$("slideshowimg2").src = "images/collectionimages/" + currentimg;
	}
	$("slideshowlink").href = ("productgallery/?collection=" + currentimg).split(".")[0]; // Remove ".jpg"
	// Prep for 1 second before fading in
	setTimeout(slideshow1, 1000);
}