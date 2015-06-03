$('.panel.panel-info.event').removeClass('panel-info')
$('.panel-heading').empty()
$('.next').removeClass('hidden')
$('.progress-bar.progress-bar-warning.progress-bar-striped.active').removeClass('active').removeClass('progress-bar-warning')

if "<%= j @answer_response %>" is 'correct'
  $('.panel.event').addClass('panel-success')
  $('.panel-heading').append('<b>Podałeś poprawną odpowiedź!</b>')
  $('.progress-bar.progress-bar-striped').addClass('progress-bar-success')
else
  $('.panel.event').addClass('panel-danger')
  $('.panel-heading').append('<b>Podałeś złą odpowiedź!</b>')
  $('.progress-bar.progress-bar-striped').addClass('progress-bar-danger')

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