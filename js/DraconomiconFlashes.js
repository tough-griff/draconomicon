import $ from 'jquery';
import React from 'react';

import Flashes from './components/Flashes';

const DraconomiconFlashes = {
  init() {
    React.render(
      <Flashes
        initialFlashes={JSON.parse($('meta[name="drac:flashes"]').attr('content'))}
      />,
      $('#react-flashes')[0]
    );
  },

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
