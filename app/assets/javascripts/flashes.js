!function(Draconomicon) {
  'use strict';

  var DraconomiconFlashes = {
    add: function(type, text) {
      $(window).trigger('add.flash', {
        flashType: type,
        flashText: text
      });
    },

    remove: function(i) {
      $(window).trigger('remove.flash', {
        flashIndex: i
      });
    }
  };

  Draconomicon.Flashes = DraconomiconFlashes;
}(this.Draconomicon);
