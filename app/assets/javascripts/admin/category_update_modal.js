$(document).ready( function ()  {
	$('.edit_btn').click(function(e) {
		e.preventDefault();
		var form = $('#update_category_form'),
			url = $(this).data('url');
			var name = $(this).data('name');
			var weight = $(this).data('weight');
			var code = $(this).data('code');
		$('#category_updateModal').on('shown.bs.modal', function () {
			$(form).attr('action', url);
			$('#category_name').val(name);
			$('#category_weight').val(weight);
			$('#category_code').val(code);
		});
	});
});

