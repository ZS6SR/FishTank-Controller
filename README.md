# FishTank-Controller
So this is a simple start to a project that I have been meaning to undertake for the longest time.  I have plans to expland it but for now I simply want a web frontend on my Raspberry PI to display the water temperature, room temperature and humidity (just because I can) and turn on a couple of white/blue lights in my fishtank.  I am using Node.js, I will confess that am a RANK beginner in this realm, and RRDTool to log the measurements I am taking.  

Hardware Components:  
====================  
Raspberry PI  
Relay board to control lights  
DS18B20 Temperature Sensor for the Water Temp.  
AM2302 Temperature/Humidity Sensor for Room conditions  
BMP085 Temperature / Barometric Pressure for extra room conditions  
2x Cool white LED strip  
2x Blue LED strip  

Software Components:  
====================
Raspbian (Stretch - Lite)  
Node.js  
PM2 - to run and manage the app at startup.  
Express  
Socket.Io  
i2c-bus - I am not sure I need this but I would love to get Node.js to read the BMP085 and display the hPa  
DS18B20  
node-dht-sensor  
OnOff - To controll the GPIO pins on the Raspberry Pi  
sqlite3 - this has 3 tables 1x events, 1x maint (still to be implemented, 1x waterCond to record things like pH etc  
Charts.js - this is used to plot a line graph of the water parameters that are kept in the database  
  
Python (used for the RRD database to hold the water temperatures so I can build a graph or two)  
python-rrdtool (sudo apt-get install python-rrdtool)  

