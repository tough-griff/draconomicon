$(document).ready(function() {
  var $flash = $('.flash'),
      animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';

  $flash.addClass('fade-in').on('click', function() {
    var $elem = $(this);
    $elem.toggleClass('fade-in fade-out').one(animationEnd, function() {
      $elem.remove();
    });
  });
});
