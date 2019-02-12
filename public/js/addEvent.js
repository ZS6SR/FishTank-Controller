
//Make connection
var socket	= io.connect("http://192.168.100.50:8080");
var eventDateField = document.getElementById("eventDate");
var eventTimeField = document.getElementById("eventTime");
var currentWaterTempTxtField = document.getElementById("eventWaterTemp");

setInterval(function() {
	var dt   = new Date();
	var day  = ("0"+dt.getDate()).slice(-2);
	var mnth = ("0"+(dt.getMonth()+1)).slice(-2);
	var year = dt.getFullYear();
	var hour = ("0"+dt.getHours()).slice(-2);
	var mins  = ("0"+dt.getMinutes()).slice(-2);

	eventDateField.value = day+"-"+mnth+"-"+year;
	eventTimeField.value = hour+":"+mins;
}, 1000);

socket.on('currentWaterTemp',function(data){
	currentWaterTempTxtField.value = data;
});
