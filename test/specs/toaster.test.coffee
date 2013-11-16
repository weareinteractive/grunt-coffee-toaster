'use strict'

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

# See http://visionmedia.github.io/mocha/ for Mocha tests.
# See http://chaijs.com/api/assert/ for Chai assertion types.

module.exports =
  "Test #toaster":
    "was successful": () ->
      assert.isTrue grunt.file.exists('test/tmp/test.js')
      assert.equal grunt.file.read('test/tmp/test.js'), grunt.file.read('test/expected/foo.js')
