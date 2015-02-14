var seasons_ready;
seasons_ready = function() {
  $('[data-toggle="popover"]').popover({html:true})
};

$(document).ready(seasons_ready);
$(document).on('page:load', seasons_ready);
