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
          <td>' + "<%= j event.start_date.to_formatted_s %>" + '</td>
        </tr>
        <tr>
          <th>Koniec</th>
          <td>' + "<%= j event.end_date.to_formatted_s %>" + '</td>
        </tr>
        <tr>
          <th>Szczegóły</th>
          <td>' + "<%= j event.details %>" + '</td>
        </tr>
      </tbody>
    </table>'
  buttons:
    success:
      label: 'Nowe wydarzenie'
      className: 'btn-success new-event'
      callback: ->
    warning:
      label: 'Edytuj'
      className: 'btn-warning edit-event'
      callback: ->
    danger:
      label: 'Usuń'
      className: 'btn-danger delete-event'
      callback: ->
    default:
      label: 'Zamknij'
      className: 'btn-default'