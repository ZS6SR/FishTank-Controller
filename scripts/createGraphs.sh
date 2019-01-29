#!/bin/bash

echo "Creating 2 Day Water Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2days.png -s 'now-2d' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Days' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE2:watertemp#003366'

echo "Creating 2 Weeks Water Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2weeks.png -s 'now-2w' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Weeks' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE2:watertemp#003366'

echo "Creating 2 Months Water Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2months.png -s 'now-2m' -e 'now' -w '500' -h '200' -u 30 -t 'Water Temperature for Last 2 Months' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE2:watertemp#003366'

echo "Creating 2 Year Water Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2years.png -s 'now-2y' -e 'now' -w '500' -h '200' -u 30 -t 'Room Temperature for Last 2 Years' -v 'Celsius' 'DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#6495ed:Water Temperature' 'LINE2:watertemp#003366'



echo "Creating 2 Day Room Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2days.png -s 'now-2d' -e 'now' -w '500' -h '200' -u 30 -t 'Room Temperature and Humidity for Last 2 Days' -v 'Celsius and % Humitity' 'DEF:roomtemp=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:roomtemp:AVERAGE' 'DEF:humidity=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:humidity:AVERAGE' 'AREA:roomtemp#ffa64c:Room Temperature' 'LINE2:humidity#ff0000:Room Humidity' 'LINE2:roomtemp#ff794c'

echo "Creating 2 Weeks Room Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2weeks.png -s 'now-2w' -e 'now' -w '500' -h '200' -u 30 -t 'Room Temperature and Humidity for Last 2 Days' -v 'Celsius and % Humitity' 'DEF:roomtemp=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:roomtemp:AVERAGE' 'DEF:humidity=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:humidity:AVERAGE' 'AREA:roomtemp#ffa64c:Room Temperature' 'LINE2:humidity#ff0000:Room Humidity' 'LINE2:roomtemp#ff794c'

echo "Creating 2 Months Room Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2months.png -s 'now-2m' -e 'now' -w '500' -h '200' -u 30 -t 'Room Temperature and Humidity for Last 2 Days' -v 'Celsius and % Humitity' 'DEF:roomtemp=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:roomtemp:AVERAGE' 'DEF:humidity=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:humidity:AVERAGE' 'AREA:roomtemp#ffa64c:Room Temperature' 'LINE2:humidity#ff0000:Room Humidity' 'LINE2:roomtemp#ff794c'

echo "Creating 2 Year Room Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2years.png -s 'now-2y' -e 'now' -w '500' -h '200' -u 30 -t 'Room Temperature and Humidity for Last 2 Days' -v 'Celsius and % Humitity' 'DEF:roomtemp=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:roomtemp:AVERAGE' 'DEF:humidity=/home/pi/nodetests/ftc/public/rrd/roomTemp.rrd:humidity:AVERAGE' 'AREA:roomtemp#ffa64c:Room Temperature' 'LINE2:humidity#ff0000:Room Humidity' 'LINE2:roomtemp#ff794c'

