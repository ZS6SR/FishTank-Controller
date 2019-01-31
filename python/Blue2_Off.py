#!/usr/bin/python

import RPi.GPIO as GPIO

ledPin = 6 # Pin for Blue (2)

GPIO.setwarnings(False)
# Pin Setup:
GPIO.setmode(GPIO.BCM)
GPIO.setup(ledPin, GPIO.OUT) # LED pin set as output

GPIO.output(ledPin, GPIO.LOW);  #Turn on the White1 LED light

#GPIO.cleanup() # cleanup all GPIO
