const express      = require('express');
const bodyParser   = require("body-parser");
const socket	   = require('socket.io');
const ds18b20      = require('ds18b20'); //used to read temperature sensor AM2302
const dht22_sensor = require('node-dht-sensor'); //Used to read the temp and humidity on the DHT22 sensor
const tempInt      = 3000; //read the temperature everyt 3 seconds
const Gpio         = require('onoff').Gpio; //include onoff to interact with the GPIO
const white_1      = new Gpio(26, 'out'); //use GPIO pin 26 as output
const blue_1       = new Gpio(19, 'out'); //use GPIO pin 19 as output
const white_2      = new Gpio(13, 'out'); //use GPIO pin 13 as output
const blue_2       = new Gpio(6, 'out'); //use GPIO pin 6 as output

const sqlite3      = require('sqlite3').verbose();
const file         = "ftc.db";
const db           = new sqlite3.Database(file);

const appPort      = 8080;

//App Setup
const app 	       = express();

app.set('views', 'views');
app.set('view engine', 'pug');

const server       = app.listen(appPort, function(){
	console.log("Listening for requests on port >" + appPort + "<");
});

//Socket setup
const io	       = socket(server);

//Static Files
app.use(express.static("public"));

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

//This is a test to see if I can post from a form
app.post("/addEvent", function (req, res) {
	var waterCondID = 0;
	var cl2 = req.body.cl2;
	var no3 = req.body.no3;
	var no2 = req.body.no2;
	var gh = req.body.gh;
	var kh = req.body.kh;
	var ph = req.body.ph;
	var insertEvent = 'INSERT INTO events (eventDate, eventTime, eventComment, waterCondID) VALUES(?,?,?,?)';
	var resState    = "xxx";
	var resMsg      = "xxx";
	
	if (!cl2 && !no3 && !no2 && !gh && !kh && !ph) {
		if (req.body.eventComment) {
			db.run(insertEvent,[req.body.eventDate, req.body.eventTime, req.body.eventComment, waterCondID]);
			resState  = "Success";
			resMsg = "Successfully added a new Event";
			res.render('eventResponse', { result: resState,
									message: resMsg,
									date: req.body.eventDate, 
									time: req.body.eventTime,
									eventComment: req.body.eventComment,
									cl2: cl2,
									no3: no3,
									no2: no2,
									gh: gh,
									kh: kh,
									ph: ph,
									temp: req.body.waterTemp
									})
		};
	}
	else {
		db.run('INSERT INTO waterCond (recordDate, recordTime, cl2, no3, no2, gh, kh, ph, tempAtReading) VALUES(?,?,?,?,?,?,?,?,?)', [req.body.eventDate, req.body.eventTime, cl2, no3, no2, gh, kh, ph, req.body.waterTemp]);
		
		db.get('SELECT seq as ID FROM sqlite_sequence WHERE name="waterCond"', [], (err, row) =>{
			if (err) {
				console.log(err);
				resState  = "Fail";
				resMsg = "Failed to insert Event: " + err;
				res.render('eventResponse', { result: resState,
									message: resMsg,
									date: req.body.eventDate, 
									time: req.body.eventTime,
									eventComment: req.body.eventComment,
									cl2: cl2,
									no3: no3,
									no2: no2,
									gh: gh,
									kh: kh,
									ph: ph,
									temp: req.body.waterTemp
									})
			}
			else {
				waterCondID = row.ID;
				if (req.body.eventComment) {
					db.run(insertEvent,[req.body.eventDate, req.body.eventTime, req.body.eventComment, waterCondID]);
					resState  = "Success";
					resMsg = "Successfully added a new Event including water conditions.";
					res.render('eventResponse', { result: resState,
									message: resMsg,
									date: req.body.eventDate, 
									time: req.body.eventTime,
									eventComment: req.body.eventComment,
									cl2: cl2,
									no3: no3,
									no2: no2,
									gh: gh,
									kh: kh,
									ph: ph,
									temp: req.body.waterTemp
									})
				};
			}
		});
	}
	
});

app.get("/showEvents", function (req, res) {
	db.all("SELECT * FROM events order by id desc", function(err, rows) {
		res.render('showEvents', { rows: rows });
	});
});

app.get("/showWaterParms", function (req, res) {
	res.render('showWaterParms');
});

io.on('connection', function(socket) {
	//console.log("New Connection: " + socket.id);

//============================== Send back the waterParameters that wer ecollected ==============================
	//socket.on('waterParms', function() {
	//	console.log("About to Fetch water Params data");
		db.all("SELECT * FROM waterCond", function(err, rows) {
			socket.emit('waterParams', rows);
		});
	//});

	//As soon as a scoket connects send the current temperature
	//console.log("Current Water Temperature >" + getCurrentWaterTemp() + "<");
	socket.emit("currentWaterTemp", getCurrentWaterTemp());
	//console.log("Current Room Temperature >" + getCurrentRoomTemp() + "<");
	socket.emit("currentRoomTemp", getCurrentRoomTemp());

//============================== WHITE LIGHT ONE ==============================
	//Check the status of the Blue Light and return that so we can use the correct image
	socket.on('check_whiteLight_1', function(w1Data) { // Check the status of the white_1 light
		//console.log("White Light pin is >" + white_1.readSync() + "<");
		socket.emit('w1_status', white_1.readSync());
	});

	//Control the White1 Light
	var w1_value = 0; //static variable for current redLED status
	socket.on('white1_toggle', function(w1data) { //get light switch status from client
		w1_value = w1data;
		if (w1_value != white_1.readSync()) { //only change LED if status has changed
			white_1.writeSync(w1_value); //turn LED on or off
		}
	});

//============================== WHITE LIGHT TWO ==============================
	//Check the status of the Blue Light and return that so we can use the correct image
	socket.on('check_whiteLight_2', function(w2Data) { // Check the status of the white_1 light
		//console.log("White Light pin is >" + white_2.readSync() + "<");
		socket.emit('w2_status', white_2.readSync());
	});

	//Control the White1 Light
	var w2_value = 0; //static variable for current White_2 status
	socket.on('white2_toggle', function(w2data) { //get light switch status from client
		w2_value = w2data;
		if (w2_value != white_2.readSync()) { //only change LED if status has changed
			white_2.writeSync(w2_value); //turn LED on or off
		}
	});

//============================== BLUE LIGHT ONE ==============================
	//Check the status of the Blue Light and return that so we can use the correct image
	socket.on('check_blueLight_1', function(b1Data) { // Check the status of the blue_1 light
		//console.log("Blue Light pin is >" + blue_1.readSync() + "<");
		socket.emit('b1_status', blue_1.readSync());
	});

	//Control the Blue1 Light
	var b1_value = 0; //static variable for current blue_1 status
	socket.on('blue1_toggle', function(b1data) { //get light switch status from client
		b1_value = b1data;
		if (b1_value != blue_1.readSync()) { //only change Light if status has changed
			blue_1.writeSync(b1_value); //turn Light on or off
		}
	});

//============================== BLUE LIGHT TWO ==============================
	//Check the status of the Blue Light and return that so we can use the correct image
	socket.on('check_blueLight_2', function(b2Data) { // Check the status of the blue_1 light
		//console.log("Blue Light pin is >" + blue_2.readSync() + "<");
		socket.emit('b2_status', blue_2.readSync());
	});

	//Control the Blue1 Light
	var b2_value = 0; //static variable for current blue_2 status
	socket.on('blue2_toggle', function(b2data) { //get light switch status from client
		b2_value = b2data;
		if (b2_value != blue_2.readSync()) { //only change Light if status has changed
			blue_2.writeSync(b2_value); //turn Light on or off
		}
	});
});

//Read the value from the "DS18B20" sensor
function getCurrentWaterTemp() {
	return ds18b20.temperatureSync('28-000004e096b8');
}

function getCurrentRoomTemp() {
	var tempHumid = dht22_sensor.read(22, 5);
	//console.log('temp: ' + tempHumid.temperature.toFixed(1) + '°C, humidity: ' + tempHumid.humidity.toFixed(1) + '%');
	return tempHumid.temperature.toFixed(1);
}

process.on('SIGINT', function () { //on ctrl+c
  white_1.writeSync(0); // Turn LED off
  white_1.unexport(); // Unexport LED GPIO to free resources
  white_2.writeSync(0); // Turn LED off
  white_2.unexport(); // Unexport LED GPIO to free resources
  blue_1.writeSync(0); // Turn LED off
  blue_1.unexport(); // Unexport LED GPIO to free resources
  blue_2.writeSync(0); // Turn LED off
  blue_2.unexport(); // Unexport LED GPIO to free resources
  process.exit(); //exit completely
});
