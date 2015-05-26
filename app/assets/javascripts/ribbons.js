var ribbons_ready = function(){
  if ($('#sortableFieldList').length > 0) {
    table_width = $('#sortableFieldList').width()
    cells = $('.table').find('tr')[0].cells.length
    desired_width = table_width / cells + 'px'
    $('.table td').css('width', desired_width)
    var panelList = $('#sortableFieldList');

    panelList.sortable({
      // Only make the .panel-heading child elements support dragging.
      // Omit this to make the entire <li>...</li> draggable.
      items: '.item',
      handle: '.bars',
      axis: 'y',
      sort: function(e,ui) {
        ui.item.addClass('active-item-shadow')
      },
      stop: function(e,ui) {
        ui.item.removeClass('active-item-shadow')
        ui.item.children('td').effect('highlight', {}, 1000)
      },
      update: function(e,ui) {
        item_id = ui.item.data('item-id')
        position = ui.item.index()
        $.ajax({
          type: 'POST',
          url: 'ribbons/update_row_order',
          dataType: 'json',
          data: { ribbon: {ribbon_id: item_id, row_order_position: position } }
        })
      }
    });
  }

  $(".eyecon").on("ajax:complete", function(){
    $(this).parent().toggleClass('danger');
    $(this).find('i').toggleClass('fa-eye');
    $(this).find('i').toggleClass('fa-eye-slash');
  })
};


$(document).ready(ribbons_ready);
$(document).on('page:load', ribbons_ready);
