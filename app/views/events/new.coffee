$('.bootbox.modal.fade.in').fadeOut().remove()
$('.modal-backdrop.fade.in').remove()
$('body').removeClass("modal-open").removeProp("style")

bootbox.dialog
  title: 'Nowe wydarzenie'
  message:
    "<%= j render "/events/form"%>"
  buttons:
    default:
      label: 'Zamknij'
      className: 'btn-default'