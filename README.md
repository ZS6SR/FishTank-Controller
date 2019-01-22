# FishTank-Controller
So this is a simple start to a project that I have been meaning to undertake for the longest time.  I have plans to expland it but for now I simply want a web frontend on my Raspberry PI to display the water temperature and turn on a white/blue light in my fishtank.  I am using Node.js and I will confess that am a RANK beginner in this realm.

Hardware Components:  
====================  
Raspberry PI  
Relay board to control lights  
DS18B20 Temperature Sensor  
Cool white LED strip  
Blue LED strip  

Software Components:  
====================
Raspbian (Stretch - Lite)  
Node.js  
Express  
Socket.Io  
DS18B20
OnOff - To controll the GPIO pins on the Raspberry Pi  
Python (used for the RRD database to hold the water temperatures so I can build a graph or two)  
python-rrdtool (sudo apt-get install python-rrdtool)  

