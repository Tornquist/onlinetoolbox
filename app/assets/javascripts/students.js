var student_ready;
student_ready = function() {
  $('#student_upload').click(function(e){
    e.preventDefault();
    $('#file').click();
  });

  $('#file').change(function() {
    $('#student_upload').prop('disabled', true);
    $('#student_upload').text('Uploading');
  });
};

$(document).ready(student_ready);
$(document).on('page:load', student_ready);
