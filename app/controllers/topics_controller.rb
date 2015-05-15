class TopicsController < ApplicationController

  before_action :authenticate_user!

  expose(:topic)
  expose(:topics)

  def index
  end

  def new
  end

  def edit
  end

  def create
    self.topic = Topic.new(topic_params)
    if topic.save
      redirect_to topic, notice: 'Grupa została pomyślnie utworzona.'
    else
      render action: 'new'
    end
  end

  def update
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
