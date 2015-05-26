var offices_ready = function(){
  $(".eyecon").on("ajax:complete", function(){
    $(this).parent().toggleClass('danger');
    $(this).find('i').toggleClass('fa-eye');
    $(this).find('i').toggleClass('fa-eye-slash');
  })
};


$(document).ready(offices_ready);
$(document).on('page:load', offices_ready);
