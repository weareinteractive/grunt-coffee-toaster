# grunt-coffee-toaster

[![Build Status](https://travis-ci.org/weareinteractive/grunt-coffee-toaster.png?branch=master)](https://travis-ci.org/weareinteractive/grunt-coffee-toaster) [![devDependency Status](https://david-dm.org/weareinteractive/grunt-coffee-toaster/dev-status.png)](https://david-dm.org/weareinteractive/grunt-coffee-toaster#info=devDependencies)

> Grunt [Coffee Toaster](https://github.com/serpentem/coffee-toaster) plugin.

## Getting Started

This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-styledocco --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-styledocco');
```

## The "toaster" Task

*Run this task with the `grunt toaster` command.*

> Coffee Toaster is a minimalist build system for CoffeeScript, made for those who dare to use class definitions in CoffeeScript while being able to easily inherit from external files. The system is powered with import directives that uses wildcards facilities, exposed scopes, excluded files filter options and a packaging system that can inject your folders-as-namespaces to all your classes based on where they are under your src folder.

### Options

All options are directly passed to *Coffee Toaster*!
Please see the [Coffee Toaster documentation](https://github.com/serpentem/coffee-toaster) for all available options.

### Examples

#### Example config

```javascript
grunt.initConfig({
  toaster: {
    dist: {
      bare: false,
      minify: false,
      folders: { "src":null },
      release: "bin"
    }
  }
});

grunt.loadNpmTasks('grunt-coffee-toaster');

grunt.registerTask('default', ['toaster']);
```

## Documentation
Check out the [Coffee Toaster](https://github.com/serpentem/coffee-toaster) for further reading.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## License
Copyright (c) We Are Interactive under the [MIT licenses](https://github.com/weareinteractive/grunt-coffee-toaster/blob/master/LICENSE)
