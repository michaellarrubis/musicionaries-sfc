$(document).on('ready turbolinks:load', function() {
  var $scrollTop = $('.js-scroll-top');
  var $scrollSongList = $('.js-scroll-song-list');

  $(window).scroll(function() {
    if ($(window).scrollTop() > 250) {
      $scrollTop.addClass('show');
      $scrollSongList.addClass('show');
    } else {
      $scrollTop.removeClass('show');
      $scrollSongList.removeClass('show');
    }
  });

  $scrollTop.on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({scrollTop:0}, '300');
  });
});