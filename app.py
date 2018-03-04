from time import sleep
import RPi.GPIO as GPIO

STEPS_PER_REV = 200
ENABLE_PIN    = 27
DIR_PIN       = 17
PWM_PIN       = 18

GPIO.setmode(GPIO.BCM)
GPIO.setup(DIR_PIN,    GPIO.OUT)
GPIO.setup(PWM_PIN,    GPIO.OUT)
#  GPIO.setup(ENABLE_PIN, GPIO.OUT)
GPIO.output(DIR_PIN, 0)

pwm = GPIO.PWM( PWM_PIN, 600 )
pwm.start( 10 )

try:
	while True:
		0 + 0

except KeyboardInterrupt:
	print "\n Well bye"

except:
	print "oh noez!"

finally:
	print "cleanup : )"


	GPIO.output(ENABLE_PIN, 1) # Hehe kapot but does what I want :p TODO
	GPIO.cleanup()
