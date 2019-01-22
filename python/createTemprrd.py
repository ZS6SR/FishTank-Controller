#!/usr/bin/python

import sys
import rrdtool

ret = rrdtool.create("waterTemp.rrd", "--step", "300", "--start", '0',
 "DS:watertemp:GAUGE:600:U:U",
 "RRA:AVERAGE:0.5:1:576",
 "RRA:AVERAGE:0.5:6:672",
 "RRA:AVERAGE:0.5:24:732", 
 "RRA:AVERAGE:0.5:144:1460")

if ret:
 print rrdtool.error()
