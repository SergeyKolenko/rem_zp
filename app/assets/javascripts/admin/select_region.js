$(document).ready( function ()  {
  $('.select_region').on('click', function(e){
    e.preventDefault();
    var selected_region = 'region_id=' + $(this).data('id'),
        current_url = window.location.href;
    window.location.assign(current_url += ( current_url.indexOf('?') >= 0 ? '&' : '?' ) + selected_region);
  })
});