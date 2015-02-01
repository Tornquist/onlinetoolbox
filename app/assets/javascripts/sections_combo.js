var student_combo_ready;
student_combo_ready = function() {

  $('body').on('cocoon:after-insert', function(e, insertedItem) {
    student_combo_format();
  });
  student_combo_format();
  $('.dependent-sub option:selected:not([value])').each(function() { $(this).closest('select').css('display','none') })
};

student_combo_format = function() {
  $('.dependent-collection').dependentSelects({separator: ' > ', class: 'form-control fifty-percent-width'})
};


$(document).ready(student_combo_ready);
$(document).on('page:load', student_combo_ready);
