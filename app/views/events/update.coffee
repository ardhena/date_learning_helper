$('.bootbox.modal.fade.in').fadeOut().remove()
$('.modal-backdrop.fade.in').remove()
$('body').removeClass("modal-open").removeProp("style")

$('tr#<%= j event.id.to_s %>').empty()

$('tr#<%= j event.id.to_s %>').append('
  <td>'+"<%= j event.start_date %>"+'</td>
  <td>'+"<%= j event.end_date %>"+'</td>
  <td>'+"<%= j event.name %>"+'</td>
  <td>
    <span><%= j link_to 'Pokaż', topic_event_path(topic, event), remote: true, class: "btn btn-primary show-event" %></span>
    <span><%= j link_to 'Edytuj', edit_topic_event_path(topic, event), remote: true, class: "btn btn-warning edit-event" %></span>
    <span><%= j link_to 'Usuń', topic_event_path(topic, event), :method => :delete, :data => { :confirm => 'Are you sure?' }, remote: true, class: "btn btn-danger delete-event" %></span>
  </td>
  ')

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
      </tbody>
    </table>' +
    '<span class="button">' + "<%= j link_to 'Nowe wydarzenie', new_topic_event_path(topic), remote: true, class: "btn btn-success new-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Edytuj', edit_topic_event_path(topic, event), remote: true, class: "btn btn-warning edit-event" %>" + '</span>' +
    '<span class="button">' + "<%= j link_to 'Usuń', topic_event_path(topic, event), :method => :delete, :data => { :confirm => 'Are you sure?' }, class: "btn btn-danger delete-event" %>" + '</span>'
  buttons:
    default:
      label: 'Zamknij'
      className: 'btn-default'