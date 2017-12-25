$(function () {

  let currentImageIndex = 0;

  if (!window.carouselTimer) {
    window.carouselTimer = setInterval(carouselTransition, 3000);
  }

  function carouselTransition() {
    let $images = $('.carousel img');
    $images.css('opacity', '0');
    $images.eq(currentImageIndex % $images.length).css('opacity', '1');
    currentImageIndex++;
  }
});
