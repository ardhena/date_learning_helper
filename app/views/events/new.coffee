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

$('.bootbox.modal .modal-dialog form .form-group.string.required.event_start_date').after('<span class="btn btn-default one-day" style="margin-bottom: 15px;">Wydarzenie jednodniowe</span>')

$('span.btn.btn-default.one-day').click ->
  startDate = $('input#event_start_date').val()
  $('input#event_end_date').val(startDate)