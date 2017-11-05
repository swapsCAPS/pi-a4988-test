async = require "async"
gpio  = require "rpi-gpio"

console.log "Haha"

STEP_PIN = 13
DIR_PIN  = 11

oneRev = (cb) ->
	async.times 200, (cb) ->
		gpio.write STEP_PIN, true, cb
	, (err) ->
		throw err if err

gpio.setup STEP_PIN, gpio.DIR_OUT, oneRev

