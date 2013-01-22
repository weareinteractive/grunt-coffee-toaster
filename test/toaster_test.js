"use strict";

var grunt;

grunt = require("grunt");

exports["toaster"] = {
  setUp: function(done) {
    return done();
  },
  helper: function(test) {
    return test.done();
  }
};
