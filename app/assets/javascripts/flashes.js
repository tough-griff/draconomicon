$(document).ready(function () {
  var $flash = $('.flash');
  var $close = $('.flash-close');

  $flash.on('click', function () {
    var $elem = $(this);
    $elem.fadeOut(500, function () {
      $elem.remove();
    });
  });

  $close.on('click', function () {
    var $elem = $(this);
    var $parent = $elem.parent();
    $parent.fadeOut(500, function () {
      $parent.remove();
    });
  });
});
