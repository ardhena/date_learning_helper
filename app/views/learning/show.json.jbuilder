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
        json.media "http://w3schools.com"
        json.caption "http://i.dailymail.co.uk/i/pix/2012/07/30/article-2180605-14458CF9000005DC-629_634x400.jpg"
      end
    end
  end
end