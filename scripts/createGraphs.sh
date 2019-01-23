#!/bin/bash

echo "Creating 2 Day Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2days.png -s 'now-2d' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Days' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'

echo "Creating 2 Weeks Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2weeks.png -s 'now-2w' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Weeks' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'

echo "Creating 2 Months Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2months.png -s 'now-2m' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Months' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'

echo "Creating 2 Year Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2years.png -s 'now-2y' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last Week' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE1:watertemp#003366'

