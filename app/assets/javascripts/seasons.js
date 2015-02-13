var seasons_ready;
seasons_ready = function() {
  $('[data-toggle="popover"]').popover()
};

$(document).ready(seasons_ready);
$(document).on('page:load', seasons_ready);
