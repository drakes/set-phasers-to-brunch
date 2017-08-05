# Set Phasers to: Brunch
An app skeleton for [Brunch](http://brunch.io/).

## Overview
Brunch builds your app (compiles and concatenates scripts, etc.) and is fast at doing it.
Set Phasers to: Brunch seeds your app structure, including a JavaScript game framework: Phaser. It also provides a tiny example app to illustrate how things are hooked together, including tests.

## Features
* [Phaser](http://phaser.io/)
* [CoffeeScript](http://coffeescript.org/), with [CoffeeLint](http://www.coffeelint.org/)
* [Stylus](http://learnboost.github.io/stylus/)
* [Styledocco](http://jacobrask.github.io/styledocco/)
* Automated tests, with notifications, using:
  * [Mocha](http://mochajs.org/)
  * [Chai](http://chaijs.com/)
  * [Sinon](http://sinonjs.org/)
  * [PhantomJS](http://phantomjs.org/)

## Getting started
### Requirements
* [node](https://nodejs.org/)
* [brunch](http://brunch.io/)

Additionally, phantomjs, stylus, and styledocco should be installed globally to make their executables available (for tests and style guide):

```
npm install -g phantomjs-prebuilt stylus styledocco
```

### Create a project with this skeleton

```
brunch new [optional-output-dir] gh:drakes/set-phasers-to-brunch
```

### Build, run tests, and launch a server

```
brunch watch --server
```

Editing changes should be picked up by brunch automatically in "watch" mode and recompiled, etc., including re-running tests on script changes.

To view the app browse to: http://localhost:3333/

## License
Set Phasers to: Brunch is © [Scott Drake](http://3dmdesign.com) and available under the [MIT license](http://opensource.org/licenses/MIT).
