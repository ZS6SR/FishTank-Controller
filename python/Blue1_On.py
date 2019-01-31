#!/usr/bin/python

import RPi.GPIO as GPIO

ledPin = 19 # Pin for Blue (1)

GPIO.setwarnings(False)
# Pin Setup:
GPIO.setmode(GPIO.BCM)
GPIO.setup(ledPin, GPIO.OUT) # LED pin set as output

GPIO.output(ledPin, GPIO.HIGH);  #Turn on the White1 LED light

