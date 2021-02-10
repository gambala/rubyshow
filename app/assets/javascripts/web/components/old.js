document.addEventListener("page:load", function() {
  $('[data-toggle="tooltip"]').tooltip()

  $('.rate-course').hide();

  // Comments graduate rating
  $('#comment_graduate').change(function(){
    if(this.checked)
      $('.rate-course').fadeIn('fast');
    else
      $('.rate-course').fadeOut('fast');
  });
});
