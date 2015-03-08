//= require jquery.shorten.1.0

var ready_static;
ready_static = function() {
 $(".announcement_text").shorten();
 $(".favorite-icon").click( function() {
   $(this).closest('.favorite-entry').remove();
 });
};

$(document).ready(ready_static);
$(document).on('page:load', ready_static);
