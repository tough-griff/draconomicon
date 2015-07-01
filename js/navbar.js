const $ = require('jquery');

// Mobile-friendly navbar.
$(document).ready(() => {
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
});
