class Answer

  attr_accessor :start_date, :end_date, :question

  def initialize(args)
    if args[:end_date].empty?
      args[:end_date] = args[:start_date]
    end
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end
end