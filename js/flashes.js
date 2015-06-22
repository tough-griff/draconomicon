const $ = require('jquery');

module.exports = {
  add(key, value) {
    $(window).trigger('add.flash', {
      flashKey: key,
      flashText: value
    });
  },

  remove(key) {
    $(window).trigger('remove.flash', {
      flashKey: key
    });
  }
};
