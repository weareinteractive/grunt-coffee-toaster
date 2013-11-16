var app = {'foo':{}};

(function() {

  app.Foo = (function() {

    function Foo() {}

    Foo.prototype.hello = function(name) {
      return "hello " + name;
    };

    return Foo;

  })();

  app.foo.Bar = (function() {

    function Bar() {}

    Bar.prototype.bye = function(name) {
      return "bye " + name;
    };

    return Bar;

  })();

}).call(this);
