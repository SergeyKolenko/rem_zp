$(document).ready( function ()  {
  $('.locale_switch').on('click', function(e){
    e.preventDefault();
    var selected_locale = 'locale=' + $(this).data('locale'),
        current_url = window.location.href;
    window.location.assign(current_url += ( current_url.indexOf('?') >= 0 ? '&' : '?' ) + selected_locale);
  })
});