
module.exports = function(grunt) {
  "use strict";
  grunt.registerMultiTask("toaster", "Compile folder with Coffee Toaster.", function() {
    var basedir, options;
    options = {
      c: true
    };
    basedir = process.cwd();
    options.config = grunt.utils._.extend({}, this.data || {}, grunt.config("toasterOptions") || {});
    grunt.utils._.each(options.config, function(value, key, list) {
      if (grunt.utils._.isString(value)) {
        return list[key] = grunt.template.process(value);
      }
    });
    grunt.helper("toaster", basedir, grunt.utils._.clone(options));
    if (grunt.task.current.errorCount) {
      return false;
    } else {
      return true;
    }
  });
  return grunt.registerHelper("toaster", function(basedir, options) {
    var Toaster, toasted;
    Toaster = require("coffee-toaster").Toaster;
    try {
      toasted = new Toaster(basedir, options);
      return true;
    } catch (e) {
      grunt.log.error("Toaster error:\n" + e);
      return false;
    }
  });
};
