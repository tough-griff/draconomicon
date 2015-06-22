const React = require('expose?React!react');
const Flash = require('expose?Flash!./components/flash');
const Flashes = require('expose?Flashes!./components/flashes');


// Create a global namespace `Draconomicon`.
require('expose?Draconomicon!./draconomicon');

// Attach modules onto the Draconomicon namespace.
Draconomicon.Flashes = require('./flashes');
