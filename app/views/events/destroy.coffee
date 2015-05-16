$('.bootbox.modal.fade.in').fadeOut().remove()
$('.modal-backdrop.fade.in').remove()
$('body').removeClass("modal-open").removeProp("style")

$('tr#<%= j event.id.to_s %>').fadeOut().remove()