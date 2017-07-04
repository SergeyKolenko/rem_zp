$(document).ready( function ()  {
  $('.js-select-city').on('click', function(e){
    e.preventDefault();
    var selected_city = 'city_id=' + $(this).data('id'),
      current_url = window.location.href;
    window.location.assign(current_url += ( current_url.indexOf('?') >= 0 ? '&' : '?' ) + selected_city);
  })
});