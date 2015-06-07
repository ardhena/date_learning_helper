class EventDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def start_date
    if object.start_date.respond_to?(:to_formatted_s)
      object.start_date.to_formatted_s(:normal)
    end
  end

  def end_date
    if object.start_date.respond_to?(:to_formatted_s)
      object.start_date.to_formatted_s(:normal)
    end
  end

  def start_date_timeline
    object.start_date.to_formatted_s(:timeline)
  end

  def end_date_timeline
    object.end_date.to_formatted_s(:timeline)
  end

  def details
    object.details.to_s.gsub(/\n/, '<br/>').html_safe
  end

end
