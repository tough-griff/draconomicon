$(document).ready(function() {
  var $flash = $('.flash');

  $flash.on('click', function() {
    var $elem = $(this);
    $elem.fadeOut(500, function() {
      $elem.remove();
    });
  });
});
