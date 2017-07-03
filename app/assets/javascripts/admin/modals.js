class ModalForm {

    constructor() {
        this.modal_window = $('.js-modal-window');
        this.form = $('.js-modal-window .js-modal-form');
        this.bindingObjects();
    }

    bindingObjects() {
        $('.js-modal-form-btn').click((e) => {
            this.prepareForm($(e.currentTarget).data());
            $(this.modal_window).modal('show');
        });
        $(this.modal_window).on('hidden.bs.modal', this.clearForm);
    }

    prepareForm(data) {
        $(this.modal_window).find('h4.modal-title').text(data.title);
        $(this.form).attr('action', data.url);
        if (data.action === 'edit') {
            if ($(this.form).find('input[name="_method"]').length > 0) {
                $(this.form).find('input[name="_method"]').val('patch');
            } else {
                const method_hidden = '<input type="hidden" name="_method" value="patch">';
                $(this.form).prepend(method_hidden);
            }

            for (let key of Object.keys(data)) {
                if (key.match(/^object/)) {
                    $('[name$="[' + key.replace(/object/, '').toLowerCase() + ']"]', this.form).val(data[key]);
                }
            }
        } else {
            this.clearForm();
        }
    }

    clearForm() {
        $(this.form).find('input[name="_method"]').remove();
        $(this.form).find('input:radio, input:text, textarea, select, input:checkbox, input[type="number"]')
            .val('')
            .removeAttr('checked')
            .removeAttr('selected');
    }

}


$(document).ready(function () {
    if ($('.js-modal-form-btn').length > 0 && $('.js-modal-window .js-modal-form').length > 0) {
        new ModalForm();
    }
});