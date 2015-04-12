// Attach the Flashes controller to the global namespace.
(function(Draconomicon) {
  'use strict';

  var DraconomiconFlashes = {
    add: function(key, value) {
      $(window).trigger('add.flash', {
        flashKey: key,
        flashText: value
      });
    },

    remove: function(key) {
      $(window).trigger('remove.flash', {
        flashKey: key
      });
    }
  };

  Draconomicon.Flashes = DraconomiconFlashes;
})(this.Draconomicon);
