var student_ready;
student_ready = function() {
  $('#import_students_confirm_btn').click(function(e){
    $("#import_students_confirm_btn").attr("disabled", true);
    $("#import_students_confirm_btn").text("Importing");
  });
  $('#import_students_btn').click(function(e){
    $("#import_students_btn").attr("disabled", true);
    $("#import_students_btn").val("Uploading");
    $("#import_students_btn").siblings("a").attr("disabled", true)
    $("#import_students_form").submit();
  });

  $('input[type=file]').bootstrapFileInput();
  $("#student_json").JSONView($("#student_json").text());
};

$(document).ready(student_ready);
$(document).on('page:load', student_ready);
