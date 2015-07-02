import $ from 'jquery';

// Mobile-friendly navbar.
const Navbar = {
  init() {
    const $toggle = $('.navbar-menu-button');
    const $toggleMe = $('.navbar-toggle').removeClass('show');

    $toggle.on('click', (e) => {
      e.preventDefault();
      $toggleMe.slideToggle(() => {
        if ($toggleMe.is(':hidden')) {
          $toggleMe.removeAttr('style');
        }
      });
    });
  }
};

export default Navbar;
