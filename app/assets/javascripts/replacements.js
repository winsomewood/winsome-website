$(function () {
  if ($('.js-add-rows').length) {

    function addRow() {
      var n = $('.js-part-table tr').length - 1;
      var newRow = $('<tr>' +
        '<td>' +
        '  <input name="parts[letter][' + n + ']" size="4">' +
        '</td>' +
        '<td>' +
        '  <input name="parts[name][' + n + ']" size="25">' +
        '</td>' +
        '<td>' +
        '  <input name="parts[quantity][' + n + ']" size="2">' +
        '</td>' +
        '<td>' +
        '  <input name="parts[reason][' + n + ']" size="36">' +
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
    $('.js-add-rows').on('click', function (e) { e.preventDefault(); addRow(); });

    preserveFormValues();
  }
});
