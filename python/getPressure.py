#!/usr/bin/python

import Adafruit_BMP.BMP085 as BMP085 
import rrdtool

temp_db = "/home/pi/ftc/public/rrd/pressure.rrd"

bmp = BMP085.BMP085(mode=BMP085.BMP085_HIGHRES)

#temp = bmp.read_temperature() 
realPress = bmp.read_pressure()
altitude = bmp.read_altitude()

#Cacluate the actual pressure becausewe are at altitude
mslPress = realPress / pow(1-(altitude/44330), 5.257)

#print "realPress  = %.2f" % realPress
#print "mslPress   = %.2f" % mslPress
 
#print "Temperature     : %.2f C" % temp
#print "Actual Pressure : %.2f hPa" % (realPress / 100.0)
#print "MSL Pressure    : %.2f hpa" % (mslPress / 100.0)
#print "Altitude        : %.2f" % altitude

rrdtool.update(temp_db, 'N:%.2f:%.2f' %((realPress / 100), (mslPress / 100)))
