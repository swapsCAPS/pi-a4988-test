async = require "async"
gpio  = require "rpi-gpio"

console.log "Haha"

STEPS_PER_REV = 200
DIR_PIN       = 11
STEP_PIN      = 13
ENABLE_PIN    = 15
TURNS         = 1
TOTAL_STEPS   = TURNS * STEPS_PER_REV

async.series {
	setup: (cb) ->
		async.parallel [
			(cb) ->
				gpio.setup ENABLE_PIN, gpio.DIR_OUT, cb
			(cb) ->
				gpio.setup STEP_PIN, gpio.DIR_HIGH, cb
			(cb) ->
				gpio.setup DIR_PIN, gpio.DIR_HIGH, cb
		], cb
	turn: (cb) ->
		# gpio.write STEP_PIN, true, cb
		async.timesSeries TOTAL_STEPS, (i, cb) ->
			gpio.write STEP_PIN, 1, (err) ->
				return cb err if err
				setTimeout ->
					console.log "written! #{i + 1} times"
					gpio.write STEP_PIN, 0, cb
				, 10
		, cb
	off: (cb) ->
		gpio.write ENABLE_PIN, 1, cb
	destroy: (cb) ->
		gpio.destroy cb
}, (err) ->
	throw err if err
	console.log "done! : )"

