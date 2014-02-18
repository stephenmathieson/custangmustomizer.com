
var konami = require('konami-code');
var css = require('css-emitter');
var classes = require('classes');

var el = document.querySelector('.content');
var vrooooom = document.querySelector('#vrooooom');
var classes = classes(el);
var css = css(el);

classes.add('animated');

konami(function () {
  vrooooom.play();
  classes.add('pulse');
  css.once(function () {
    classes.remove('pulse');
  });
});
