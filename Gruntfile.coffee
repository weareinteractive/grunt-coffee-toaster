###
grunt-coffee-toaster
https://github.com/weareinteractive/grunt-coffee-toaster

Copyright (c) 2013 We Are Interactive
Licensed under the MIT license.
###

"use strict"

module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    coffeelint:
      files: ["Gruntfile.coffee", "src/**/*.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    coffee:
      tasks:
        options:
          bare: true
        files:
          "tasks/toaster.js": "src/toaster.coffee"

    clean:
      test:
        src: ["test/tmp/*"]

    toaster:
      test:
        bare: false
        minify: false
        folders: "test/fixtures/src": null
        release: "test/tmp/test.js"

    mochaTest:
      test:
        options:
          bail: true
          ui: 'exports'
          timeout: 10000
        src: ['test/specs/**/*.test.coffee']

    bump:
      options:
        pushTo: 'origin'
        commitFiles: ['-a']
        updateConfigs: ['pkg']
        files: ['package.json']


  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-bump"

  # Default task.
  grunt.registerTask 'default', ['coffeelint', 'coffee']
  grunt.registerTask 'test', ['default', 'clean', 'toaster', 'mochaTest']
