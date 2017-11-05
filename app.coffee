async = require "async"
gpio  = require "rpi-gpio"

console.log "Haha"

STEP_PIN = 13
DIR_PIN  = 11

write = ->
	gpio.write STEP_PIN, true, (err) ->
		throw err if err
		console.log "written yay!"

gpio.setup STEP_PIN, gpio.DIR_OUT, write

