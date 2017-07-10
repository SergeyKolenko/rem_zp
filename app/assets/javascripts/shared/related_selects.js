class RelatedSelects {
  constructor() {
    this.container = $('.js-related-selects');
    this.service_data = this.container.data();
    this.primary_select = $('.js-primary-select', this.container);
    this.dependent_select = $('.js-dependent-select', this.container);
    this.is_select2 = (this.primary_select.hasClass('select2') && this.dependent_select.hasClass('select2'));
    this.primary_select.change(() => this.fetchData());
  }
  
  fetchData() {
    const selected_values = this.primary_select.val();
    if (selected_values) {
      $.getJSON( this.service_data.path, this.urlData(selected_values), (response)=> {
        this.fillData(response.data);
      } );
    }
  }
  
  fillData(data) {
    const selected_values = this.dependent_select.val();
    const filtered_data = data.map((x) => {
      return { id: x[this.service_data.valueField], text: x[this.service_data.textField] }
    });
    if (this.is_select2) {
      this.dependent_select.select2({
        data: filtered_data,
        val: selected_values,
        theme: "bootstrap",
        language: window.locale
      });
    } else {
      let html = "";
      for (let item of filtered_data){
        html += "<option value='" + item[this.service_data.valueField] + "'>";
        html += item[this.service_data.textField];
        html += "</option>";
      }
      this.dependent_select.html(html).val(selected_values);
    }
  }
  
  urlData(value) {
    let data = {};
    data[this.service_data.param] = value;
    return data;
  }
}

$(function () {
      if ($('.js-related-selects').length) {
        const selects = new RelatedSelects();
        selects.fetchData();
      }
    }
);