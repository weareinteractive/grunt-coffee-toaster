'use strict'

chai = require('chai')
grunt = require('grunt')

assert = chai.assert
chai.Assertion.includeStack = true

module.exports =
  "Test #toaster":
    "was successful": () ->
      assert.isTrue grunt.file.exists('test/tmp/test.js')
      assert.equal grunt.file.read('test/tmp/test.js'), grunt.file.read('test/fixtures/expected.js')
