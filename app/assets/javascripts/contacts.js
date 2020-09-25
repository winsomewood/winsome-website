$(function () {
  $('.itemNoLabel').on('mouseover', function(e) {
    $('.helper-item')
    .show()
    .css({ opacity: 1, top: e.currentTarget.offsetTop - 510 - 20 })
  })
  $('.itemNoLabel').on('mouseout', function(e) {
    $('.helper-item').css({ opacity: 0 }).hide()
  })

  $('.controlNoLabel').on('mouseover', function(e) {
    $('.helper-control')
      .show()
      .css({ opacity: 1, top: e.currentTarget.offsetTop - 510 - 20 })
  })
  $('.controlNoLabel').on('mouseout', function(e) {
    $('.helper-control').css({ opacity: 0 }).hide()
  })  
});