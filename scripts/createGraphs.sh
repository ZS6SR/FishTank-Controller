#!/bin/bash

#=====================================================================
# WATER TEMP
#=====================================================================
echo "Creating 2 Day Water Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2days.png -s 'now-2d' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Water Temperature for Last 2 Days' -v 'Celsius' \
DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE \
VDEF:Average=watertemp,AVERAGE \
CDEF:waterTempClean=watertemp,UN,0,watertemp,IF \
AREA:watertemp#6495ed:"Water Temperature" \
LINE2:watertemp#003366 \
GPRINT:watertemp:MAX:"Maximum\:%8.2lf %s" \
GPRINT:watertemp:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff0000:"Average"

echo "Creating 2 Weeks Water Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2weeks.png -s 'now-2w' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Water Temperature for Last 2 Weeks' -v 'Celsius' \
DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE \
VDEF:Average=watertemp,AVERAGE \
CDEF:waterTempClean=watertemp,UN,0,watertemp,IF \
AREA:watertemp#6495ed:"Water Temperature" \
LINE2:watertemp#003366 \
GPRINT:watertemp:MAX:"Maximum\:%8.2lf %s" \
GPRINT:watertemp:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff0000:"Average"

echo "Creating 2 Months Water Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2months.png -s 'now-2m' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Water Temperature for Last 2 Months' -v 'Celsius' \
DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE \
VDEF:Average=watertemp,AVERAGE \
CDEF:waterTempClean=watertemp,UN,0,watertemp,IF \
AREA:watertemp#6495ed:"Water Temperature" \
LINE2:watertemp#003366 \
GPRINT:watertemp:MAX:"Maximum\:%8.2lf %s" \
GPRINT:watertemp:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff0000:"Average"

echo "Creating 2 Year Water Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/waterTemp_2years.png -s 'now-2y' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Room Temperature for Last 2 Years' -v 'Celsius' \
DEF:watertemp=/home/pi/nodetests/ftc/public/rrd/waterTemp.rrd:watertemp:AVERAGE \
VDEF:Average=watertemp,AVERAGE \
CDEF:waterTempClean=watertemp,UN,0,watertemp,IF \
AREA:watertemp#6495ed:"Water Temperature" \
LINE2:watertemp#003366 \
GPRINT:watertemp:MAX:"Maximum\:%8.2lf %s" \
GPRINT:watertemp:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff0000:"Average"

#=====================================================================
# HUMIDITY
#=====================================================================
echo "Creating 2 Day Humidity Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/humidity_2days.png -s 'now-2d' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Humidity for Last 2 Days' -v 'Percentage' \
DEF:humidity=/home/pi/nodetests/ftc/public/rrd/humidity.rrd:humidity:AVERAGE \
VDEF:Average=humidity,AVERAGE \
AREA:humidity#5cd65c:"Humidity" \
LINE2:humidity#29a329 \
GPRINT:humidity:MAX:"Maximum\:%8.2lf %s" \
GPRINT:humidity:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff80ff:"Average"

echo "Creating 2 Weeks Humidity Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/humidity_2weeks.png -s 'now-2w' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Humidity for Last 2 Weeks' -v 'Percentage' \
DEF:humidity=/home/pi/nodetests/ftc/public/rrd/humidity.rrd:humidity:AVERAGE \
VDEF:Average=humidity,AVERAGE \
AREA:humidity#5cd65c:"Humidity" \
LINE2:humidity#29a329 \
GPRINT:humidity:MAX:"Maximum\:%8.2lf %s" \
GPRINT:humidity:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff80ff:"Average"

echo "Creating 2 Months Humidity Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/humidity_2months.png -s 'now-2m' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Humidity for Last 2 Months' -v 'Percentage' \
DEF:humidity=/home/pi/nodetests/ftc/public/rrd/humidity.rrd:humidity:AVERAGE \
VDEF:Average=humidity,AVERAGE \
AREA:humidity#5cd65c:"Humidity" \
LINE2:humidity#29a329 \
GPRINT:humidity:MAX:"Maximum\:%8.2lf %s" \
GPRINT:humidity:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff80ff:"Average"

echo "Creating 2 Year Humidity Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/humidity_2years.png -s 'now-2y' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Humidity for Last 2 Years' -v 'Percentage' \
DEF:humidity=/home/pi/nodetests/ftc/public/rrd/humidity.rrd:humidity:AVERAGE \
VDEF:Average=humidity,AVERAGE \
AREA:humidity#5cd65c:"Humidity" \
LINE2:humidity#29a329 \
GPRINT:humidity:MAX:"Maximum\:%8.2lf %s" \
GPRINT:humidity:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average#ff80ff:"Average"

#=====================================================================
# BAROMETRIC PRESSURE
#=====================================================================
echo "Creating 2 Day Pressure Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/pressure_2days.png -s 'now-2d' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Barometric Pressure for Last 2 Days' -v 'hPa' \
DEF:actualPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:actualPress:AVERAGE \
DEF:mslPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:mslPress:AVERAGE \
AREA:mslPress#ccccff \
LINE2:mslPress#9999ff:"MSL Pressure" \
GPRINT:mslPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:mslPress:MIN:"Minimum\:%8.2lf %s\n" \
AREA:actualPress#ebccff \
LINE2:actualPress#d699ff:"Actual Pressure" \
GPRINT:actualPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:actualPress:MIN:"Minimum\:%8.2lf %s\n"

echo "Creating 2 Weeks Pressure Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/pressure_2weeks.png -s 'now-2w' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Barometric Pressure for Last 2 Weeks' -v 'hPa' \
DEF:actualPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:actualPress:AVERAGE \
DEF:mslPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:mslPress:AVERAGE \
AREA:mslPress#ccccff \
LINE2:mslPress#9999ff:"MSL Pressure" \
GPRINT:mslPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:mslPress:MIN:"Minimum\:%8.2lf %s\n" \
AREA:actualPress#ebccff \
LINE2:actualPress#d699ff:"Actual Pressure" \
GPRINT:actualPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:actualPress:MIN:"Minimum\:%8.2lf %s\n"

echo "Creating 2 Months Pressure Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/pressure_2months.png -s 'now-2m' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Barometric Pressure for Last 2 Months' -v 'hPa' \
DEF:actualPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:actualPress:AVERAGE \
DEF:mslPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:mslPress:AVERAGE \
AREA:mslPress#ccccff \
LINE2:mslPress#9999ff:"MSL Pressure" \
GPRINT:mslPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:mslPress:MIN:"Minimum\:%8.2lf %s\n" \
AREA:actualPress#ebccff \
LINE2:actualPress#d699ff:"Actual Pressure" \
GPRINT:actualPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:actualPress:MIN:"Minimum\:%8.2lf %s\n"

echo "Creating 2 Year Pressure Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/pressure_2years.png -s 'now-2y' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Barometric Pressure for Last 2 Years' -v 'hPa' \
DEF:actualPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:actualPress:AVERAGE \
DEF:mslPress=/home/pi/nodetests/ftc/public/rrd/pressure.rrd:mslPress:AVERAGE \
AREA:mslPress#ccccff \
LINE2:mslPress#9999ff:"MSL Pressure" \
GPRINT:mslPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:mslPress:MIN:"Minimum\:%8.2lf %s\n" \
AREA:actualPress#ebccff \
LINE2:actualPress#d699ff:"Actual Pressure" \
GPRINT:actualPress:MAX:"Maximum\:%8.2lf %s" \
GPRINT:actualPress:MIN:"Minimum\:%8.2lf %s\n"

#=====================================================================
# ROOM TEMPS
#=====================================================================
echo "Creating 2 Day Room Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2days.png -s 'now-2d' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Room Temperatures for Last 2 Days' -v 'Celsius' \
DEF:roomtemp1=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp1:AVERAGE \
DEF:roomtemp2=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp2:AVERAGE \
VDEF:Average1=roomtemp1,AVERAGE \
VDEF:Average2=roomtemp2,AVERAGE \
LINE2:roomtemp1#9900cc:"Room Temperature AM2302" \
GPRINT:roomtemp1:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp1:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average1#c61aff:"Average AM2302\n" \
LINE2:roomtemp2#cc0099:"Room Temperature BMP085" \
GPRINT:roomtemp2:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp2:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average2#ff1ac6:"Average BMP085\n"

echo "Creating 2 Weeks Room Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2weeks.png -s 'now-2w' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Room Temperatures for Last 2 Weeks' -v 'Celsius' \
DEF:roomtemp1=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp1:AVERAGE \
DEF:roomtemp2=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp2:AVERAGE \
VDEF:Average1=roomtemp1,AVERAGE \
VDEF:Average2=roomtemp2,AVERAGE \
LINE2:roomtemp1#9900cc:"Room Temperature AM2302" \
GPRINT:roomtemp1:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp1:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average1#c61aff:"Average AM2302\n" \
LINE2:roomtemp2#cc0099:"Room Temperature BMP085" \
GPRINT:roomtemp2:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp2:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average2#ff1ac6:"Average BMP085\n"

echo "Creating 2 Months Room Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2months.png -s 'now-2m' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Room Temperatures for Last 2 Months' -v 'Celsius' \
DEF:roomtemp1=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp1:AVERAGE \
DEF:roomtemp2=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp2:AVERAGE \
VDEF:Average1=roomtemp1,AVERAGE \
VDEF:Average2=roomtemp2,AVERAGE \
LINE2:roomtemp1#9900cc:"Room Temperature AM2302" \
GPRINT:roomtemp1:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp1:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average1#c61aff:"Average AM2302\n" \
LINE2:roomtemp2#cc0099:"Room Temperature BMP085" \
GPRINT:roomtemp2:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp2:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average2#ff1ac6:"Average BMP085\n"

echo "Creating 2 Year Room Temp Graph";
rrdtool graph /home/pi/nodetests/ftc/public/imgs/roomTemp_2years.png -s 'now-2y' -e 'now' -w '1000' -h '400' \
-u 30 -t 'Room Temperatures for Last 2 Years' -v 'Celsius' \
DEF:roomtemp1=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp1:AVERAGE \
DEF:roomtemp2=/home/pi/nodetests/ftc/public/rrd/roomTemps.rrd:roomtemp2:AVERAGE \
VDEF:Average1=roomtemp1,AVERAGE \
VDEF:Average2=roomtemp2,AVERAGE \
LINE2:roomtemp1#9900cc:"Room Temperature AM2302" \
GPRINT:roomtemp1:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp1:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average1#c61aff:"Average AM2302\n" \
LINE2:roomtemp2#cc0099:"Room Temperature BMP085" \
GPRINT:roomtemp2:MAX:"Maximum\:%8.2lf %s" \
GPRINT:roomtemp2:AVERAGE:"Average\:%8.2lf %s" \
HRULE:Average2#ff1ac6:"Average BMP085\n"
