class EventsController < ApplicationController
  def event_params
    params.require(:event).permit(:description, :end_date, :end_time, :event_organizer, :name, :start_date, :start_time, :location, :creator_name, :creator_email)
  end
  
  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "#{@event.name} was successfully created."
      redirect_to events_path
    else 
      # flash[:error] = @event.errors
      flash.now[:warning] = "You have not filled out all required fields."
      render :new
    end
  end
    
end