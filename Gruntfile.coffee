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
        folders: "test/fixtures":"app"
        release: "test/tmp/test.js"

    mochacov:
      options:
        bail: true
        ui: 'exports'
        require: 'coffee-script'
        compilers: ['coffee:coffee-script']
        files: 'test/specs/**/*.coffee'
      all:
        options:
          reporter: 'spec'

    bump:
      options:
        pushTo: 'origin'
        commitFiles: ['-a']
        updateConfigs: ['pkg']
        files: ['package.json']


  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-bump"

  # Default task.
  grunt.registerTask 'default', ['coffeelint', 'coffee']
  grunt.registerTask 'test', ['default', 'clean', 'toaster', 'mochacov']
