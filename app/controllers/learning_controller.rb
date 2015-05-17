class LearningController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:topics)

  def index
  end

  def show
  end
end
