//Make connection
var socket	= io.connect("http://192.168.100.50:8080");

//Query DOM
var currentTempTxtField = document.getElementById("currentWaterTemp");
var w1checkBox	= document.getElementById("whiteLight_1");
var b1checkBox	= document.getElementById("blueLight_1");

//Emit Events
//=============
// Check if the status of the Light is on/off
// I.e. Ask what the pin status on the RPi is
socket.emit('check_whiteLight_1'); 
socket.emit('check_blueLight_1');

//Listen for Button presses (Well clicks on the image) ... :)
w1checkBox.addEventListener('change', function(){
	socket.emit("white1_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
});

b1checkBox.addEventListener('change', function(){
	socket.emit("blue1_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
});

//Listen for events on the socket
//This is to set which image needs 
//to be set (I.e. Green in already 
//on or RED if ligth is off)
//===============================

socket.on('currentTemp',function(data){
	currentTempTxtField.innerHTML = data;
});
	
socket.on('w1_status',function(w1Status){
	if (w1Status) { // If the GPIO pin is on then we set the checkbox to checked.
		document.getElementById("whiteLight_1").checked = true;
	}
});
	
socket.on('b1_status',function(b1Status){
	if (b1Status) { // If the GPIO pin is on then we set the checkbox to checked.
		document.getElementById("blueLight_1").checked = true;
	}
});
	
	