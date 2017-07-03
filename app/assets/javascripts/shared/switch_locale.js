$(document).ready( function ()  {
  $('.locale_switch').on('click', function(e){
    e.preventDefault();
    var selected_locale = $(this).data('locale'),
        current_url = location.pathname;
    window.location.assign(current_url + '?locale=' + selected_locale);
  })
});