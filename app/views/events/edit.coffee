$('.bootbox.modal.fade.in').fadeOut().remove()
$('.modal-backdrop.fade.in').remove()
$('body').removeClass("modal-open").removeProp("style")

bootbox.dialog
  title: 'Edycja'
  message:
    "<%= j render "/events/form"%>" +
    '<span class="button">' + "<%= j link_to 'Nowe wydarzenie', new_topic_event_path(topic), remote: true, class: "btn btn-success new-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Pokaż', topic_event_path(topic, event), remote: true, class: "btn btn-primary show-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Usuń', topic_event_path(topic, event), :method => :delete, :data => { :confirm => 'Are you sure?' }, remote: true, class: "btn btn-danger delete-event" %>" + '</span>'
  buttons:
    default:
      label: 'Zamknij'
      className: 'btn-default'

$('.bootbox.modal .modal-dialog form .form-group.string.required.event_start_date').after('<span class="btn btn-default one-day" style="margin-bottom: 15px;">Wydarzenie jednodniowe</span>')

$('span.btn.btn-default.one-day').click ->
  startDate = $('input#event_start_date').val()
  $('input#event_end_date').val(startDate)