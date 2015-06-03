class AnswersController < ApplicationController

  expose(:answer) { Answer.new(answer_params) }

  def submit
  end

  def answer_params
    params.require(:answer).permit(:start_date, :end_date, :question)
  end
end