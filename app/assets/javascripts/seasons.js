var seasons_ready;
seasons_ready = function() {
  $('#season-container .input-daterange').datepicker({
    format: "mm/dd/yyyy",
    todayBtn: "linked"
  });

  $('#game-container .input-group.date').datepicker({
    format: "mm/dd/yyyy",
    todayBtn: "linked"
  });
};

$(document).ready(seasons_ready);
$(document).on('page:load', seasons_ready);
