json.timeline do
  json.headline topic.name
  json.type 'default'
  json.text topic.description
  json.asset do
  end
  json.date do
    json.array! topic.events do |event|
      json.startDate event.start_date_timeline
      json.endDate event.end_date_timeline
      json.headline event.name
      json.text event.details
      json.asset do
        json.media event.media
        json.caption event.media
      end
    end
  end
end