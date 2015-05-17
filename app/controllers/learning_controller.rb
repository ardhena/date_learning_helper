class LearningController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:topics) { current_user.topics }
  expose_decorated(:topic)

  def index
  end

  def show
    respond_to do |format|
      format.html
      format.json
    end
  end
end
