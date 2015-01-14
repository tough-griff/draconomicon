$(document).ready(function () {
  var $flash = $('.flash');
  var $close = $('.flash-close');

  $flash.on('click', function () {
    var $elem = $(this);
    $elem.fadeOut(500, function () {
      $elem.remove();
    });
  });
});
