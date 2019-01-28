//Make connection
var socket	= io.connect("http://192.168.100.50:8080");

//Query DOM
var currentTempTxtField = document.getElementById("tempBox");
var w1checkBox	= document.getElementById("whiteLight_1");
var w2checkBox	= document.getElementById("whiteLight_2");
var b1checkBox	= document.getElementById("blueLight_1");
var b2checkBox	= document.getElementById("blueLight_2");

//Emit Events
//=============
// Check if the status of the Light is on/off
// I.e. Ask what the pin status on the RPi is
socket.emit('check_whiteLight_1'); 
socket.emit('check_whiteLight_2'); 
socket.emit('check_blueLight_1');
socket.emit('check_blueLight_2');

//Listen for Button presses (Well clicks on the image) ... :)
w1checkBox.addEventListener('change', function(){
	socket.emit("white1_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
});

w2checkBox.addEventListener('change', function(){
	socket.emit("white2_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
});

b1checkBox.addEventListener('change', function(){
	socket.emit("blue1_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
});

b2checkBox.addEventListener('change', function(){
	socket.emit("blue2_toggle", Number(this.checked)); //send button status to server (as 1 or 0)
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

socket.on('w2_status',function(w2Status){
	if (w2Status) { // If the GPIO pin is on then we set the checkbox to checked.
		document.getElementById("whiteLight_2").checked = true;
	}
});
	
socket.on('b1_status',function(b1Status){
	if (b1Status) { // If the GPIO pin is on then we set the checkbox to checked.
		document.getElementById("blueLight_1").checked = true;
	}
});

socket.on('b2_status',function(b2Status){
	if (b2Status) { // If the GPIO pin is on then we set the checkbox to checked.
		document.getElementById("blueLight_2").checked = true;
	}
});
	
	
