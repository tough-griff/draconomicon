// Provide a global namespace.
(function(global) {
  'use strict';

  var Draconomicon = {
    welcome: function() {
      console.log('Welcome to The Draconomicon!');
    }
  };

  global.Draconomicon = Draconomicon;
})(this);
