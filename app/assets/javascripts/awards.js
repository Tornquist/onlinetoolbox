var awards_ready;
awards_ready = function() {
  if ($(".student_ribbon_checkbox").length) {
    $(".student_ribbon_checkbox").change( function() {
      student_id = $('#student_id')[0].value;
      ribbon_id = $(this).val();
      $.ajax({
        type: 'POST',
        url: '/student_ribbons/create_destroy',
        dataType: 'json',
        data: { ribbon: {ribbon_id: ribbon_id, student_id: student_id } }
      });
    });
  }

  if ($("#student_office_office_id").length) {
    $('body').on('change', '#student_office_office_id', function() {
      student_id = $('#student_id')[0].value;
      office_id = $(this).val();
      $.ajax({
        type: 'POST',
        url: '/student_offices/create_destroy',
        dataType: 'json',
        data: { student_office: {office_id: office_id, student_id: student_id } }
      });
    });
  }

};

$(document).ready(awards_ready);
$(document).on('page:load', awards_ready);
