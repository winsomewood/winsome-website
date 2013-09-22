/**
* Drop down menu
*/

var timeout = 500;
var closetimer;
window.onload = initiate;

function initiate() {
	$("productlink").onmouseover = openmenu;
	$("productlink").onmouseout = startclosetime;
	
	// Preload hover icon
	var image = new Image();
	image.src = "/images/scrolliconhover.gif";
	
	var product = $$("#productlink a")[0];
	product.onmouseover = hoverArrow;
	product.onmouseout = unHoverArrow;
	
	document.onclick = closemenu;
}

function openmenu() {
	canceltimer();
	$("dropdownmenu").style.visibility = "visible";
}

function closemenu() {
	$("dropdownmenu").style.visibility = "hidden";
}

function startclosetime() {
	closetimer = setTimeout(closemenu, timeout);
}

function canceltimer()
{
	if(closetimer)
	{
		clearTimeout(closetimer);
		closetimer = null;
	}
}

function hoverArrow() {
	this.childElements()[0].src = "/images/scrolliconhover.gif";
}

function unHoverArrow() {
	this.childElements()[0].src = "/images/scrollicon.gif";
}