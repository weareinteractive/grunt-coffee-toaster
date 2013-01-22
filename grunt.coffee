module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    coffeelint:
      files: ["grunt.coffee", "src/**/*.coffee"]

    coffeelintOptions:
      max_line_length:
        value: 200
        level: "error"

    coffee:
      tasks:
        src: ["src/tasks/*.coffee"],
        dest: "tasks"
      test:
        src: ["src/test/*.coffee"],
        dest: "test"

    lint:
      files: ["tasks/**/*.js", "test/**/*.js"]

    test:
      files: ["test/**/*.js"]

    watch:
      files: ["src/**/*.coffee"]
      tasks: "default"

    jshint:
      options:
        curly: true
        eqeqeq: true
        immed: true
        latedef: true
        newcap: true
        noarg: true
        sub: true
        undef: true
        boss: true
        eqnull: true
        node: true
        es5: true

      globals: {}

  # Load local tasks.
  grunt.loadTasks "tasks"

  # Load npm tasks.
  grunt.loadNpmTasks "grunt-coffee"
  grunt.loadNpmTasks "grunt-coffeelint"

  # Default task.
  grunt.registerTask "default", "coffeelint coffee lint test"