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

  if ($('.student_rank').length) {
    $('.student_rank').click( function() {

      type = "";
      if ($(this).hasClass("approve")) { type = "approve"; }
      else if ($(this).hasClass("issue")) { type = "issue"; }
      else if ($(this).hasClass("return")) { type = "return"; }

      if (confirm("Are you sure you wish to "+type+" this rank? This action is irreversible")) {
        student_id = $('#student_id')[0].value;
        officer_rank_id = $(this).parent().siblings('#officer_rank_id').val();

        $.ajax({
          type: 'POST',
          url: '/student_officer_ranks/create_update',
          dataType: 'json',
          data: { student_officer_rank: {officer_rank_id: officer_rank_id, student_id: student_id, type: type } }
        });

        var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        d = new Date();
        pretty_date = months[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear();

        $(this).replaceWith(pretty_date);
      }
      else { }
    });
  }

};

$(document).ready(awards_ready);
$(document).on('page:load', awards_ready);
