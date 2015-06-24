require('expose?$!expose?jQuery!jquery');
require('expose?React!react/addons');
require('expose?Flash!./components/flash');
require('expose?Flashes!./components/flashes');

// Create a global namespace `Draconomicon`.
require('expose?Draconomicon!./draconomicon');

// Attach modules onto the Draconomicon namespace.
Draconomicon.Flashes = require('./flashes');

require('./navbar');
