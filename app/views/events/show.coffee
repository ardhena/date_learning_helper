$('.bootbox.modal.fade.in').fadeOut().remove()
$('.modal-backdrop.fade.in').remove()
$('body').removeClass("modal-open").removeProp("style")

bootbox.dialog
  title: "<%= j event.name %>"
  message:
    '<table class= "table table-hover">
      <tbody>
        <tr>
          <th>Zdarzenie</th>
          <td>' + "<%= j event.name %>" + '</td>
        </tr>
        <tr>
          <th>Początek</th>
          <td>' + "<%= j event.start_date %>" + '</td>
        </tr>
        <tr>
          <th>Koniec</th>
          <td>' + "<%= j event.end_date %>" + '</td>
        </tr>
        <tr>
          <th>Szczegóły</th>
          <td>' + "<%= j event.details %>" + '</td>
        </tr>
        <tr>
          <th>Media</th>
          <td>' + "<a href=\"<%= j event.media %>\" target=\"_blank\">" + "<%= j event.media %>" + "</a>" + '</td>
        </tr>
      </tbody>
    </table>' +
    '<span class="button">' + "<%= j link_to 'Nowe wydarzenie', new_topic_event_path(topic), remote: true, class: "btn btn-success new-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Edytuj', edit_topic_event_path(topic, event), remote: true, class: "btn btn-warning edit-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Usuń', topic_event_path(topic, event), :method => :delete, :data => { :confirm => 'Are you sure?' }, remote: true, class: "btn btn-danger delete-event" %>" + '</span>'
  buttons:
    default:
      label: 'Zamknij'
      className: 'btn-default'