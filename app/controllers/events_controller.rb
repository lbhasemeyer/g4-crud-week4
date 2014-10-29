class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    set_event
  end

  def edit
    set_event
  end

  def update
    respond_to do |format|
      set_event
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @event = Event.new event_params
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def event_params
      params.require(:event).permit(:date, :location, :description, :capacity, :requires_id)
  end

  def set_event
    @event = Event.find params[:id]
  end

end
