$(function () {

  $('.select_collection .collection').on('click', function () {
    $(".collection_image").attr('src', $(this).data('imageSrc'));
    $(".collection_caption").text($(this).text());
    $(".collection_link").attr('href', $(this).data('aHref'));
  })

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
