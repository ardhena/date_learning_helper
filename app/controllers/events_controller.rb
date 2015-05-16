class EventsController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:event)
  expose_decorated(:topic)
  expose_decorated(:events) { topic.events }

  def show
    respond_to do |format|
      format.html
      format.js
      format.json { render json: event }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
      format.json { render json: event }
    end
  end

  def create
    self.event = Event.new(event_params)
    event.topic_id = topic.id
    respond_to do |format|
      if event.save
        format.html { redirect_to topic_path(topic), notice: 'Wydarzenie zostało dodane.' }
        format.js
        format.json { render json: events }
      else
        format.js { render action: 'new' }
        format.json { render json: event }
      end
    end
  end

  def update
    self.event = Event.find(params[:id])
    respond_to do |format|
      if event.update(event_params)
        format.html { redirect_to topic_path(topic), notice: 'Wydarzenie zostało zaktualizowane.' }
        format.js
        format.json { render json: events }
      else
        format.js { render action: 'edit' }
        format.json { render json: event }
      end
    end
  end

  def destroy
    event.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(topic), notice: 'Wydarzenie zostało usunięte.' }
      format.js
      format.json { render json: events }
    end
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :name, :details)
  end
end
