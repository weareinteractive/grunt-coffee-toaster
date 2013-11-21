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
      files: ["Gruntfile.coffee", "tasks/**/*.coffee", "test/**/*.coffee"]
      options:
        max_line_length:
          value: 200
          level: "error"

    clean:
      test:
        src: ["test/tmp/*"]

    toaster:
      test:
        bare: false
        minify: false
        folders: "test/fixtures":"app"
        release: "test/tmp/test.js"

    # Unit tests.
    mochacov:
      options:
        bail: true
        ui: "exports"
        require: "coffee-script"
        compilers: ["coffee:coffee-script"]
        files: "test/specs/**/*.coffee"
      all:
        options:
          reporter: "spec"

    # Deployment
    bumper:
      options:
        tasks: ["default"]
        files: ["package.json"]
        updateConfigs: ["pkg"]

  # Actually load this plugin's task(s).
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks "grunt-mocha-cov"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-bumper"

  # Task.
  grunt.registerTask "default", ["coffeelint"]
  grunt.registerTask "test", ["default", "clean", "toaster", "mochacov"]
