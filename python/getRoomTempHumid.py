#!/usr/bin/python

import Adafruit_DHT as dht
import rrdtool

temp_db = "/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd"

h,t = dht.read_retry(dht.DHT22, 5)

rrdtool.update(temp_db, 'N:%s:%s' %(t, h))

print ('Temp={0:0.1f}*C  Humidity={1:0.1f}%'.format(t, h))
