var seasons_combo;
seasons_combo = function() {
  $('#season_id').change(function() {
    $('#season_id').closest('.field').find('#section_id')
  });


  $('body').on('change','#season_id',function() {

    season_obj = $(this);
    section_obj = $(this).closest('.field').find('#section_id');
    $.getJSON('/seasons/'+$(this).val()+'/sections',null, function(responseJSON){ // GET JSON value from the server
      //$("#mySelect option").remove(); // Remove all the <option> child tags from the select box.
      season_obj.closest('.field').find('#section_id option').remove();
      section_obj.prop('disabled',false);
      $.each(responseJSON, function(index, item) { //jQuery way of iterating through a collection
        section_obj.append($('<option>')
                              .text(item.name)
                              .attr('value', item.id));
      });
    });
    return false;
  });

};

$(document).ready(seasons_combo);
$(document).on('page:load', seasons_combo);
