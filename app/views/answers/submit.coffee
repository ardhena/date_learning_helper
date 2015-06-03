$('.panel.panel-info.event').removeClass('panel-info')
$('.panel-heading').empty()

if "<%= j @answer_response %>" is 'correct'
  $('.panel.event').addClass('panel-success')
  $('.panel-heading').append('<b>Podałeś poprawną odpowiedź!</b>')
else
  $('.panel.event').addClass('panel-danger')
  $('.panel-heading').append('<b>Podałeś złą odpowiedź!</b>')

$('.panel-body')
  .empty()
  .append('
    <table class= "table table-hover">
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
      </table>
    ')