$(document).ready(function() {
  var $toggle = $('.navbar-menu-button');
  var $toggleMe = $('.navbar-toggle').removeClass('show');

  $toggle.on('click', function(e) {
    e.preventDefault();
    $toggleMe.slideToggle(function() {
      if ($toggleMe.is(':hidden')) {
        $toggleMe.removeAttr('style');
      }
    });
  });
});
