// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).on('ready page:change', function() {
  $('[data-toggle="tooltip"]').tooltip()
  $('.rate-course').hide();

  $('#comment_graduate').change(function(){
    if(this.checked)
      $('.rate-course').fadeIn('fast');
    else
      $('.rate-course').fadeOut('fast');
  });

  $('#comment_content').keyup(function() {

    var empty = false;
    $('#comment_content').each(function() {
      if ($(this).val().length == 0) {
        empty = true;
      }
    });

    if (empty) {
      $('#submit_comment').attr('disabled', 'disabled');
    } else {
      $('#submit_comment').removeAttr('disabled');
    }
  });
});
