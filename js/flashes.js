import $ from 'jquery';
import React from 'react';

// Mount Flashes component.
import Flashes from './components/flashes';
$(document).ready(() => {
  React.render(
    <Flashes
      initialFlashes={JSON.parse($('meta[name="drac:flashes"]').attr('content'))}
    />,
    $('#react-flashes')[0]
  );
});

const DraconomiconFlashes = {
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

export default DraconomiconFlashes;
