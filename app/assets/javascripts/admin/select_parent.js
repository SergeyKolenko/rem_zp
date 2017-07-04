$(document).ready( function ()  {
  $('.js-select-parent').on('click', function(e){
    e.preventDefault();
    var parent_param = $(this).data('param'),
        current_url = window.location.href;
    window.location.assign(current_url += ( current_url.indexOf('?') >= 0 ? '&' : '?' ) + parent_param);
  })
});