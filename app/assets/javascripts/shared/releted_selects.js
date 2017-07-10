class ReletedSelects {
  constructor() {
    this.container = $('.js-related-selects');
    this.service_data = this.container.data();
    this.primary_select = $('.js-primary-select', this.container);
    this.dependent_select = $('.js-dependent-select', this.container);
  }
  
  fetchData() {
    if (this.primary_select.val()) {
    
    }
  }
}