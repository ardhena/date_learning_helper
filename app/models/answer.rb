class Answer

  attr_accessor :start_date, :end_date, :question

  def initialize(args)
    if args[:end_date].empty?
      args[:end_date] = args[:start_date]
    end
    @start_date = args[:start_date].to_date
    @end_date = args[:end_date].to_date
    @question = Event.find(args[:question])
  end

  def valid?
    if @start_date == @question.start_date && @end_date == @question.end_date
      true
    else
      false
    end
  end
end