$(function () {
  $('.controlNumberLabel').on('mouseover', function(e) {
    $('.helper-control')
      .show()
      .css({ opacity: 1, top: e.currentTarget.offsetTop - 510 - 20 })
  })
  $('.itemNumberLabel').on('mouseover', function(e) {
    $('.helper-item')
      .show()
      .css({ opacity: 1, top: e.currentTarget.offsetTop - 510 - 20 })
  })
  $('.controlNumberLabel').on('mouseout', function(e) {
    $('.helper-control').css({ opacity: 0 }).hide()
  })
  $('.itemNumberLabel').on('mouseout', function(e) {
    $('.helper-item').css({ opacity: 0 }).hide()
  })
  if ($('.js-add-rows').length) {

    function addRow() {
      var n = $('.js-part-table tr').length - 1;
      var newRow = $('<tr>' +
        '<td>' +
        '  <input type="text" name="parts[letter][' + n + ']" size="4">' +
        '</td>' +
        '<td>' +
        '  <input type="text" name="parts[name][' + n + ']" size="25">' +
        '</td>' +
        '<td>' +
        '  <input type="text" name="parts[quantity][' + n + ']" size="2">' +
        '</td>' +
        '<td>' +
        '  <input type="text" name="parts[reason][' + n + ']" size="36">' +
        '</td>' +
      '</tr>')
      $('.js-part-table').append(newRow);
      if (n == 15) {
        $('.js-add-rows').hide();
      }
    }

    function preserveFormValues() {
      partData = JSON.parse(JSON.parse($('.js-part-table').data('parts'))); // wow plz fix this encoding bug
      if (partData) {
        $.each(partData["letter"], function (k) {

          while (k >= $('.js-part-table tr').length - 1) {
            addRow();
          }
          $('input[name="parts\[letter\]\[' + k + '\]"]').val(partData["letter"][k])
          $('input[name="parts\[name\]\[' + k + '\]"]').val(partData["name"][k])
          $('input[name="parts\[quantity\]\[' + k + '\]"]').val(partData["quantity"][k])
          $('input[name="parts\[reason\]\[' + k + '\]"]').val(partData["reason"][k])
        })
      }
    }

    function sendFullHardwareSetHandlers() {
      $('#replacement_send_full_hardware_set_1').on('change', function(e) {
        $('.js-parts').find('input, button').prop('disabled', true);
        $('.js-part-information').text('Part Information')
      });
      $('#replacement_send_full_hardware_set_0').on('change', function(e) {
        $('.js-parts').find('input, button').prop('disabled', false);
        $('.js-part-information').text('Part Information (Required)')
      });
      $('.js-parts').find('input, button').prop('disabled', true);
    }

    $('.js-add-rows').on('click', function (e) { e.preventDefault(); addRow(); });
    preserveFormValues();
    sendFullHardwareSetHandlers();
    $('.replacements').on('submit', function (e) {
      if (typeof $('#replacement_send_full_hardware_set_1:checked, #replacement_send_full_hardware_set_0:checked', '.replacements').val() == "undefined") {
        e.preventDefault();
        $('.send_full_hardware_set p.errors').text('Please select an option');
      }
    })
  }
});
