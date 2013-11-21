###
grunt-coffee-toaster
https://github.com/weareinteractive/grunt-coffee-toaster

Copyright (c) 2013 We Are Interactive
Licensed under the MIT license.
###

"use strict"

module.exports = (grunt) ->

  # Please see the grunt documentation for more information regarding task and
  # helper creation: https://github.com/cowboy/grunt/blob/master/docs/toc.md

  # -----------------------------------------------------------------------------------------------
  # ~ Tasks
  # -----------------------------------------------------------------------------------------------

  grunt.registerMultiTask "toaster", "Compile sources with Coffee Toaster.", ->

    options = { c:true, config:this.data }

    grunt.verbose.writeflags options, 'Options'

    # process template vars
    grunt.util._.each options.config, (value, key, list) ->
      if grunt.util._.isString(value) then list[key] = grunt.template.process(value)

    # toast it
    toast process.cwd(), options

    return if grunt.task.current.errorCount then false else true

  # -----------------------------------------------------------------------------------------------
  # ~ Helpers
  # -----------------------------------------------------------------------------------------------

  toast = (baseDir, options) ->
    try
      Toaster = require("coffee-toaster").Toaster
      new Toaster(baseDir, options)
      return true
    catch error
      grunt.log.error "Toaster error:\n" + error
      return false
