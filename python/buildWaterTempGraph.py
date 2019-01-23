#!/usr/bin/python

import subprocess


# for 1 hour
subprocess.run["rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_hour.png -s 'now-1h' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last Hour' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'"]

# for 1 day
subprocess.run["rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_day.png -s 'now-1d' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last Day' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'"]

# for 1 week
subprocess.run["rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_week.png -s 'now-1w' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last Week' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'"]
