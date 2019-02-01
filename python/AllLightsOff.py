#!/usr/bin/python

import RPi.GPIO as GPIO

blue1Pin = 19
blue2Pin = 6
white1Pin = 26
white2Pin = 13

GPIO.setwarnings(False)
# Pin Setup:
GPIO.setmode(GPIO.BCM)
GPIO.setup(blue1Pin, GPIO.OUT) # LED pin set as output
GPIO.setup(blue2Pin, GPIO.OUT) # LED pin set as output
GPIO.setup(white1Pin, GPIO.OUT) # LED pin set as output
GPIO.setup(white2Pin, GPIO.OUT) # LED pin set as output

GPIO.output(blue1Pin, GPIO.LOW);
GPIO.output(blue2Pin, GPIO.LOW);
GPIO.output(white1Pin, GPIO.LOW);
GPIO.output(white2Pin, GPIO.LOW);

#GPIO.cleanup() # cleanup all GPIO
