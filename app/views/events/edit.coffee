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