$(function () {
  if ($('.select_collection').length) {
    $('.select_collection .collection').on('click', function () {
      $(".collection_image").attr('src', $(this).data('imageSrc'));
      $(".collection_caption").text($(this).text());
      $(".collection_link").attr('href', $(this).data('aHref'));
    })
    $('.select_collection .collection').eq(0).trigger("click");
  }

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
  $(".large_link").on("click", function (e) {
    e.preventDefault();
    $(".fancybox-thumb").eq(0).trigger("click");
  });
});
