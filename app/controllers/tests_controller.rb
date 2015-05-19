class TestsController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:topics) { current_user.topics }
  expose_decorated(:topic)

  def index
  end

  def show
  end
end
