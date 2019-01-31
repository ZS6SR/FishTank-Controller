#!/usr/bin/python

import sys
import rrdtool

ret = rrdtool.create("roomTemps.rrd", "--step", "300", "--start", '0',
 "DS:roomtemp1:GAUGE:600:U:U", # From AM2302
 "DS:roomtemp2:GAUGE:600:U:U", # From BMP085
 "RRA:AVERAGE:0.5:1:576",
 "RRA:AVERAGE:0.5:6:672",
 "RRA:AVERAGE:0.5:24:732", 
 "RRA:AVERAGE:0.5:144:1460")

# 2 days of 5 mins averages
# 2 Weeks of 1/2 hour averages
# 2 Months of 2 hour averages
# 2 years of 12 hour averages

if ret:
 print rrdtool.error()
