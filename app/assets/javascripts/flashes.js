$(document).ready(function () {
  $('.flash-close').click(function (e) {
    var $elem = $(this);
    var $parent = $elem.parent();
    e.preventDefault();
    $parent.fadeOut(500, function () {
      $parent.remove();
    });
  });
});
