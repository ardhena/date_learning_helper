class EventsController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:event)
  expose_decorated(:topic)

  def show
    respond_to do |format|
      format.js
      format.json { render json: event, status: :ok, location: event }
    end
  end

  def new
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
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
        format.json { render json: event, status: :created, location: event }
      else
        # needs fixing
        format.js { render 'new' }
        format.json { render json: event, status: :error, location: event }
      end
    end
  end

  def update
    self.event = Event.find(params[:id])
    respond_to do |format|
      if event.update(event_params)
        format.html { redirect_to topic_path(topic), notice: 'Wydarzenie zostało zaktualizowane.' }
        format.json { render json: event, status: :updated, location: event }
      else
        # needs fixing
        format.js { render 'edit' }
        format.json { render json: event, status: :error, location: event }
      end
    end
  end

  def event_params
    params.require(:event).permit(:start_date, :end_date, :name, :details)
  end
end
