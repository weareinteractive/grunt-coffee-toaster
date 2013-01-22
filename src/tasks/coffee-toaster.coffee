#
# * grunt-toaster
# * https://github.com/franklin/grunt-coffee-toaster
# *
# * Copyright (c) 2013 franklin
# * Licensed under the MIT license.
#
module.exports = (grunt) ->
  "use strict"

  # Please see the grunt documentation for more information regarding task and
  # helper creation: https://github.com/cowboy/grunt/blob/master/docs/toc.md

  # -----------------------------------------------------------------------------------------------
  # ~ Tasks
  # -----------------------------------------------------------------------------------------------

  grunt.registerMultiTask "toaster", "Compile folder with Coffee Toaster.", ->
    options = c: true
    basedir = process.cwd()

    # read config
    options.config = grunt.utils._.extend({}, @data or {}, grunt.config("toasterOptions") or {})

    # process template vars
    grunt.utils._.each options.config, (value, key, list) ->
      list[key] = grunt.template.process(value)  if grunt.utils._.isString(value)


    # grunt.log.write(JSON.stringify(options));
    grunt.helper "toaster", basedir, grunt.utils._.clone(options)
    if grunt.task.current.errorCount
      false
    else
      true

  # -----------------------------------------------------------------------------------------------
  # ~ Helpers
  # -----------------------------------------------------------------------------------------------

  grunt.registerHelper "toaster", (basedir, options) ->
    Toaster = require("coffee-toaster").Toaster
    try
      toasted = new Toaster(basedir, options)
      return true
    catch e
      grunt.log.error "Toaster error:\n" + e
      return false
