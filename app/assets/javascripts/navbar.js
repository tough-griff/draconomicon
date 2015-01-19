$(document).ready(function() {
  var $menuToggle = $('#js-mobile-menu'),
      $menu = $('#js-nav-menu');

  $menuToggle.unbind();
  $menu.removeClass('show');

  $menuToggle.on('click', function(e) {
    e.preventDefault();
    $menu.slideToggle(function() {
      if ($menu.is(':hidden')) {
        $menu.removeAttr('style');
      }
    });
  });
});
