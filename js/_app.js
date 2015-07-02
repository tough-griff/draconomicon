import $ from 'jquery';
import Draconomicon from './Draconomicon';
import DraconomiconFlashes from './DraconomiconFlashes';
import DraconomiconNavbar from './DraconomiconNavbar';

// Create a global namespace `Draconomicon`.
window.Draconomicon = Draconomicon;
// Attach modules onto the Draconomicon namespace.
Draconomicon.Flashes = DraconomiconFlashes;
Draconomicon.Navbar = DraconomiconNavbar;

// Bind jQuery to the global scope.
window.$ = $;

$(document).ready(() => {
  Draconomicon.welcome();
  Draconomicon.Flashes.init();
  Draconomicon.Navbar.init();
});
