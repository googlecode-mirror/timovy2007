var defaultFontSize = 76;
var currentFontSize = defaultFontSize;

function changeFontSize(sizeDifference){
	currentFontSize = parseInt(currentFontSize) + parseInt(sizeDifference * 5);
	if(currentFontSize > 100){
		currentFontSize = 100;
	}else if(currentFontSize < 60){
		currentFontSize = 60;
	}
	setFontSize(currentFontSize);
};

function setFontSize(fontSize){
	var stObj = (document.getElementById) ? document.getElementById('content_area') : document.all('content_area');
	document.body.style.fontSize = fontSize + '%';
};
