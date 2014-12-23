$(function () {

  var initialized = false;
  if (!initialized) {
    $('body').on('mouseover', '.fancybox-thumb', function () {
      initialized = true;
      $(".fancybox-thumb").fancybox({
        prevEffect: 'none',
        nextEffect: 'none',
        helpers: {
          title: {
            type: 'inside'
          },
          thumbs: {
            width: 50,
            height: 50
          }
        }
      });
    });
  }
});
