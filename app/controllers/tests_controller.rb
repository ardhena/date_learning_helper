class TestsController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:topics) { current_user.topics }
  expose_decorated(:topic)

  def index
  end

  def show
    params[:seed] ||= Random.new_seed
    srand params[:seed].to_i
    @events = Kaminari.paginate_array(topic.events.shuffle).page(params[:page]).per(1)
    @percent = ((@events.current_page - 1).to_f / @events.total_pages * 100)
  end
end
