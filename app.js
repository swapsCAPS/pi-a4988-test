const async     = require('async')
const _         = require('underscore')
const { spawn } = require('child_process')

async.series([
  (cb) => spawn('python', [ 'open.py' ]   ).on('close', cb),
  (cb) => {
    console.log('opened')
    cb()
  },
  (cb) => spawn('python', [ 'home.py' ]   ).on('close', cb),
  (cb) => {
    console.log('homed')
    cb()
  },
  (cb) => spawn('python', [ 'release.py' ]).on('close', cb),
  (cb) => {
    console.log('released')
    cb()
  },
], (error) => {
  console.log('done')
})
