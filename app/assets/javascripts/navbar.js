$(document).ready(function() {
  var menuToggle = $('#js-mobile-menu').unbind();
  $('#js-nav-menu').removeClass("show");

  menuToggle.on('click', function(e) {
    e.preventDefault();
    $('#js-nav-menu').slideToggle(function(){
      if($('#js-nav-menu').is(':hidden')) {
        $('#js-nav-menu').removeAttr('style');
      }
    });
  });
});
