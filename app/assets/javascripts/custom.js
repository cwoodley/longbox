$(document).ready(function(){
  $('.best_in_place').best_in_place();

  $('#remove_cover_url-toggle').click(function(){
    $('#remove_cover_url-group').toggleClass('hidden');
  });

  $('img.thumbnail').hide();
  $('.spinner').spin();

  $('img.thumbnail').load(function() {
    $('.spinner').fadeOut();
    $(this).fadeIn();
  });
});
