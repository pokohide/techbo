// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require semantic-ui
//= require libs/tag-it
//= require libs/lazyload
//= require social-share-button
//= require_tree .

$(document).ready(function() {
  $('.ui.dropdown').dropdown({ on: 'hover' })
  $('.special.cards .image').dimmer({ on: 'hover' })
  $('img.lazy').lazyload({ effect : "fadeIn" })

  if(gon.uid) {
    $('.ui.modal').modal('show')
    $('.ui.modal .button.ok').on('click', function(e) {
      e.preventDefault()
      $('.ui.modal').modal('close')
    })
  }
})
