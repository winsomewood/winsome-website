var loading = false;

window.onload = function() {
	var imageObj = new Image();

	var collectiongrouplinks = $$("#collectionlinks a");
	for (var i = 0; i < collectiongrouplinks.length; i++) {
		collectiongrouplinks[i].onclick = changeCollection;

		// Preload images
		var text = (navigator.appName === "Microsoft Internet Explorer") ? collectiongrouplinks[i].innerText : collectiongrouplinks[i].textContent;
		imageObj.src = "/images/collectionimages/" + text + ".jpg";
		imageObj.alt = text;
	}
};

function changeCollection() {
	var text = (navigator.appName === "Microsoft Internet Explorer") ? this.innerText : this.textContent;

	startLoading();

	var oldlink = $$("#collectionlinks span")[0];
	if (oldlink) {
		var replacementlink = document.createElement("a");
		replacementlink.href = "javascript:void(0)";
		replacementlink.textContent = oldlink.textContent;
		replacementlink.innerText = oldlink.innerText;
		replacementlink.id = oldlink.id;
		replacementlink.onclick = changeCollection;
		$("collectionlinks").replaceChild(replacementlink, oldlink);
	}
	var newcollectionlink = document.createElement("span");
	newcollectionlink.textContent = text;
	newcollectionlink.innerText = text;
	newcollectionlink.id = this.id;
	$(newcollectionlink).addClassName("currentlink");
	$("collectionlinks").replaceChild(newcollectionlink, this);

	$("collectionimagediv").childElements()[0].childElements()[1].src = "/images/collectionimages/" + text + ".jpg";
	$("collectionimagediv").childElements()[0].childElements()[1].alt = "";
	$("collectionimagediv").childElements()[0].href = "/productgallery/?collection=" + text;
	$("collectiontitle").textContent = $("collectiontitle").innerText = text;
	endLoading();
	return false;
}

/**
* Helper methods
*/
function startLoading() {
	document.body.style.cursor = "wait";
	$("collectionimagediv").childElements()[0].style.display = "none";
	$("collectionimagediv").childElements()[0].childElements()[1].src = "/images/blank.jpg";

	if (!loading) {
		var loading = document.createElement("div");
		loading.innerText = loading.textContent = "Loading...";
		loading.id = "loading";
		$("collectionimagediv").appendChild(loading);
	}
	loading = true;
}

function endLoading() {
	document.body.style.cursor = "default";
	$("collectionimagediv").removeChild($("loading"));
	$("collectionimagediv").childElements()[0].style.display = "inline";
	loading = false;
}
