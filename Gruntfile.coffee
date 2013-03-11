module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffeelint:
      files: [
        "src/**/*.coffee"
        "test/**/*.coffee"
      ]
      options:
        max_line_length:
          value: 200
          level: "error"

    coffee:
      build:
        files:
          "tasks/<%= pkg.name %>.js": "src/**/*.coffee"
        options:
          bare: true

    mochaTest:
      files: [
        'test/**/*.test.coffee'
      ]

    mochaTestConfig:
      options:
        compilers: 'coffee:coffee-script'
        reporter: 'list'
        bail: true
        ui: 'bdd'

  # Load local tasks.
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-contrib-coffee"

  # Default task.
  grunt.registerTask 'default', ['coffeelint', 'coffee']
  grunt.registerTask 'test', ['coffeelint', 'coffee', 'mochaTest']
