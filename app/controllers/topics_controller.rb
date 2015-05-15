class TopicsController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:topic)
  expose_decorated(:topics) { current_user.topics }

  def index
  end

  def new
  end

  def edit
  end

  def create
    self.topic = Topic.new(topic_params)
    topic.user_id = current_user.id
    if topic.save
      redirect_to topic, notice: 'Grupa została pomyślnie utworzona.'
    else
      render action: 'new'
    end
  end

  def update
    topic = Topic.find(params[:id])
    if topic.update(topic_params)
      redirect_to topic, notice: 'Grupa została pomyślnie zaktualizowana.'
    else
      render action: 'edit'
    end
  end

  def destroy
    topic.destroy
    redirect_to topics_url, notice: 'Grupa została usunięta.'
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :description)
    end
end
