$(document).ready( function ()  {

  $('.update-btn').click(function(e) {
    e.preventDefault();
    var form = $('#update_region_form'),
        url = $(this).data('url'),
        code = $(this).data('code'),
        name = $(this).data('name');
    $('#region_modal').on('shown.bs.modal', function () {
      $(form).attr('action', url);
      $('#region_code').attr('value', code);
      $('#region_name').attr('value', name);
    });
  });
});