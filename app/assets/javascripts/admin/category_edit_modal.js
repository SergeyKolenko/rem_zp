$(document).ready( function ()  {
	$('.edit_btn').click(function(e) {
		e.preventDefault();
		var form = $('#update_category_form'),
			url = $(this).data('url');
		$('#category_updateModal').on('shown.bs.modal', function () {
			$(form).attr('action', url);
		});
	});
});

