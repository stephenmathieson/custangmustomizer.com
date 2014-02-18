
var konami = require('konami-code');
var css = require('css-emitter');
var classes = require('classes');

var el = document.querySelector('.content');
var classes = classes(el);
var css = css(el);

classes.add('animated');

konami(function () {
  classes.add('pulse');
  css.once(function () {
    classes.remove('pulse');
  });
});
