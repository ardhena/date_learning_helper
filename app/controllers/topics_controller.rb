class TopicsController < ApplicationController

  before_action :authenticate_user!

  expose(:topic)
  expose(:topics)

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def topic_params
    params.require(:topic).permit(:name, :description)
  end

end
