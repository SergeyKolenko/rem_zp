jQuery(function($){
  $(".telephone-field").mask("099-999-99-99");
});

$(document).ready( function ()  {
  $('.region_select').on('change', function(){
  //  добавить метод для получения списка городов и районов в зависимости от выбронного региона
  });

  $('.select2').select2({
    theme: "bootstrap",
    language: "ru"
  });
});