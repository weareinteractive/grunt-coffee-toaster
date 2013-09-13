module.exports = function(grunt) {
  "use strict";
  var toast;
  grunt.registerMultiTask("toaster", "Compile folder with Coffee Toaster.", function() {
    var options;
    options = {
      c: true,
      config: this.data
    };
    grunt.verbose.writeflags(options, 'Options');
    grunt.util._.each(options.config, function(value, key, list) {
      if (grunt.util._.isString(value)) {
        return list[key] = grunt.template.process(value);
      }
    });
    toast(process.cwd(), options);
    if (grunt.task.current.errorCount) {
      return false;
    } else {
      return true;
    }
  });
  return toast = function(baseDir, options) {
    var Toaster, error;
    try {
      Toaster = require("coffee-toaster").Toaster;
      new Toaster(baseDir, options);
      return true;
    } catch (_error) {
      error = _error;
      grunt.log.error("Toaster error:\n" + error);
      return false;
    }
  };
};
