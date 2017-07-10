$(document).ready(function () {
  $('.js-select-parent').on('click', function (e) {
    e.preventDefault();
    const parent_param = $(this).data('param');
    let current_url = window.location.href;
    window.location.assign(current_url += ( current_url.indexOf('?') >= 0 ? '&' : '?' ) + parent_param);
  })
});