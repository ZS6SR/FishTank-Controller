#!/usr/bin/python

# for 1 hour
rrdtool graph waterTemp_hour.png -s 'now-1h' -e 'now' -w '700' -h '350' -u 30 -t 'Water Temperature' -v 'Celsius' 'DEF:watertemp=waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#003366:Water Temperature'

# for 1 day
rrdtool graph waterTemp_day.png -s 'now-1d' -e 'now' -w '700' -h '350' -u 30 -t 'Water Temperature' -v 'Celsius' 'DEF:watertemp=waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#003366:Water Temperature'

# for 1 week
rrdtool graph waterTemp_week.png -s 'now-1w' -e 'now' -w '700' -h '350' -u 30 -t 'Water Temperature' -v 'Celsius' 'DEF:watertemp=waterTemp.rrd:watertemp:AVERAGE' 'CDEF:waterTempClean=watertemp,UN,0,watertemp,IF' 'AREA:watertemp#003366:Water Temperature'
