const $ = window.$ = require('jquery');

// Create a global namespace `Draconomicon`.
const Draconomicon = window.Draconomicon = require('./draconomicon');
// Attach modules onto the Draconomicon namespace.
Draconomicon.Flashes = require('./flashes');
require('./navbar');

$(document).ready(() => {
  Draconomicon.welcome();
});
