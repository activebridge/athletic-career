$(window).scroll(function() {
  if ($('.navbar').offset().top > 100) {
    $('.navbar-fixed-top').addClass('top-nav');
    $('.pull-left').addClass('logo');
  } else {
    $('.navbar-fixed-top').removeClass('top-nav');
    $('.pull-left').removeClass('logo');
  }
});
