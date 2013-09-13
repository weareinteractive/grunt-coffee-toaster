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
        files:
          "tasks/toaster.js": "src/toaster.coffee"
        options:
          bare: true

    mochaTest:
      test:
        options:
          bail: true
          ui: 'exports'
          timeout: 10000
          reporter: 'TAP'
          require: 'test/coverage'
        src: ['test/**/*.coffee']
      coverage:
        options:
          quiet: true
          reporter: 'html-cov'
          captureFile: 'test/coverage.html'
        src: ['test/**/*.test.coffee']

    watch:
      files: ["src/**/*.test.coffee"]
      tasks: "default"

  # Load local tasks.
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks "grunt-mocha-test"
  grunt.loadNpmTasks "grunt-contrib-coffee"

  # Default task.
  grunt.registerTask 'default', ['coffeelint', 'coffee']
  grunt.registerTask 'test', ['coffeelint', 'coffee', 'mochaTest']
