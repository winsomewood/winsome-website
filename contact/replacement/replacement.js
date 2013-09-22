var rowIndex = 0;

window.onload = function() {
	addRow();
	$("addRowImg").onclick = addRow;
};

function addRow() {
	rowIndex++;
	var row = document.createElement("div");
	
	var closeIcon = document.createElement("img");
	closeIcon.src = "close.png";
	closeIcon.onclick = removeRow;
	row.appendChild(closeIcon);
	var numberLabel = document.createElement("label");
	numberLabel.innerText = numberLabel.textContent = "* Part #: ";
	var numberField = document.createElement("input");
	numberField.type = "text";
	numberField.name = "partno_" + rowIndex;
	numberLabel.appendChild(numberField);
	row.appendChild(numberLabel);
	var quantityLabel = document.createElement("label");
	quantityLabel.innerText = quantityLabel.textContent = "Qty: ";
	var quantityField = document.createElement("input");
	quantityField.type = "text";
	quantityField.name = "quantity_" + rowIndex;
	quantityLabel.appendChild(quantityField);
	row.appendChild(quantityLabel);
	var descriptionLabel = document.createElement("label");
	descriptionLabel.innerText = descriptionLabel.textContent = "Description: ";
	var descriptionField = document.createElement("input");
	descriptionField.type = "text";
	descriptionField.name = "description_" + rowIndex;
	descriptionLabel.appendChild(descriptionField);
	row.appendChild(descriptionLabel);
	
	$("partsNeeded").insertBefore(row, $("addRow"));
	
}

function removeRow() {
	this.parentNode.parentNode.removeChild(this.parentNode);
}