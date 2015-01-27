var student_ready;
student_ready = function() {
  $('#student_upload').click(function(e){
    e.preventDefault();
    $('#file').click();
  });
};

$(document).ready(student_ready);
$(document).on('page:load', student_ready);
