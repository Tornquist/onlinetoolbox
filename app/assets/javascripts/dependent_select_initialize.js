//= require jquery.dependent-selects
var dependent_select_initialize;
dependent_select_initialize = function() {

  $('body').on('cocoon:after-insert', function(e, insertedItem) {
    student_combo_format();
  });
  student_combo_format();
  $('.dependent-sub option:selected:not([value])').each(function() { $(this).closest('select').css('display','none') })
};

student_combo_format = function() {
  $('.dependent-collection').dependentSelects({separator: ' > ', class: 'form-control fifty-percent-width'})
};


$(document).ready(dependent_select_initialize);
$(document).on('page:load', dependent_select_initialize);
