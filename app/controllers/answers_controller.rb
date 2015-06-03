class AnswersController < ApplicationController

  expose(:answer) { Answer.new(answer_params) }
  expose_decorated(:event) { answer.question }

  def submit
    if answer.valid?
      @answer_response = 'correct'
    else
      @answer_response = 'incorrect'
    end
  end

  def answer_params
    params.require(:answer).permit(:start_date, :end_date, :question)
  end
end