#!/usr/bin/python

import Adafruit_BMP.BMP085 as BMP085
import Adafruit_DHT as dht
import rrdtool

temp_db = "/home/pi/ftc/public/rrd/roomTemps.rrd"

bmp = BMP085.BMP085(mode=BMP085.BMP085_HIGHRES)

h,t = dht.read_retry(dht.DHT22, 5)
temp = bmp.read_temperature()

#print "AM2302 Temp: %.2f" %(t)
#print "BMP085 Temp: %.2f" %(temp)

rrdtool.update(temp_db, 'N:%s:%s' %(t, temp))
