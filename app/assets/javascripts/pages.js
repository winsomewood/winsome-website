$(function () {
  var currentImageIndex = 0;
  setInterval(carouselTransition, 3000);

  function carouselTransition() {
    var $images = $('.carousel img');
    $images.css('opacity', '0');
    $images.eq(currentImageIndex % $images.length).css('opacity', '1');
    currentImageIndex++;
  }
});
