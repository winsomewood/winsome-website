// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Require this so that fancybox works in html
// http://fancyapps.com/fancybox/3/docs
require("@fancyapps/fancybox");

require('jquery')

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

// Turbolinks is off for now
// TODO: turn it on and fix known bugs:
// - generally navigating to some pages just causes image flickering
// - javascript needs to initialize on turbolinks load instead of on page load
// - bug where after a few Lightbox clicks in and out, the page becomes unresponsive. maybe
//   disable turbolinks specifically on these clicks? need to test more
// Turbolinks.start()

// Front page carousel
let carouselInitialized = false
$(function () {
  let currentImageIndex = 0;

  if (!carouselInitialized) {
    carouselInitialized = setInterval(carouselTransition, 3000);
  }

  function carouselTransition() {
    let $images = $('.carousel img');
    $images.css('opacity', '0');
    $images.eq(currentImageIndex % $images.length).css('opacity', '1');
    currentImageIndex++;
  }
});

// Collection page
$(function () {
  $('.select_collection .collection').on('click', function () {
    $(".collection_image").attr('src', $(this).data('imageSrc'));
    $(".collection_caption").text($(this).text());
    $(".collection_link").attr('href', $(this).data('aHref'));
  })
})

// Contact & Replacement form popup on mouseover handlers
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
});

// Replacement form
$(function () {
  if ($('.js-add-rows').length) {
    function addRow() {
      const n = $('.js-part-table tr').length - 1;
      const newRow = $('<tr>' +
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

    function prepopulatePartInformationFormValues() {
      const partData = JSON.parse(JSON.parse($('.js-part-table').data('parts'))); // wow plz fix this encoding bug
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

    function sendFullHardwareSetToggleHandlers() {
      $('#replacement_send_full_hardware_set_1').on('change', function(e) {
        $('.js-parts').find('input, button').prop('disabled', true);
        $('.js-part-information').text('Part Information')
      });
      $('#replacement_send_full_hardware_set_0').on('change', function(e) {
        $('.js-parts').find('input, button').prop('disabled', false);
        $('.js-part-information').text('Part Information (Required)')
      });

      if ($('#replacement_send_full_hardware_set_0').is(':checked')) {
        $('.js-parts').find('input, button').prop('disabled', false);
        $('.js-part-information').text('Part Information (Required)');
      } else {
        $('.js-parts').find('input, button').prop('disabled', true);
      }
    }

    function requireToggleIsSelected(e) {
      if (typeof $('#replacement_send_full_hardware_set_1:checked, #replacement_send_full_hardware_set_0:checked', '.replacements').val() == "undefined") {
        e.stopPropagation();
        e.preventDefault();
        $('.send_full_hardware_set p.errors').text('Please select an option');
      }
    }

    $('.js-add-rows').on('click', function(e) {
      e.preventDefault();
      addRow();
    });
    prepopulatePartInformationFormValues();
    sendFullHardwareSetToggleHandlers();
    $('.replacements').on('submit', requireToggleIsSelected)
  }
});


// Google Analytics
$(function () {
  if (window._gaq != null) {
    return _gaq.push(['_trackPageview']);
  } else if (window.pageTracker != null) {
    return pageTracker._trackPageview();
  }
});
