class Admin::EventsController < EventsController
  before_filter :is_admin

  def index
    @events = Event.get_all_approved
    @unapproved = Event.get_all_unconfirmed
    @todays_events = Event.getEventsForDay(Time.zone.now.to_date.strftime("%F"))
    if request.xhr?
      @todays_events = Event.getEventsForDay(params[:day])
      render :partial => 'layouts/event_list'
    end
  end

  def unapproved
    @unapproved = Event.get_all_unconfirmed
  end
  
  def new
    @event = Event.new
    render 'admin/events/new'
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      @event.confirm
      flash[:notice] = "#{@event.name} was successfully created."
      redirect_to admin_events_path
    else 
      # flash[:error] = @event.errors
      flash.now[:warning] = "You have not filled out all required fields."
      render :new
    end
  end
  
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      @event.confirm
      flash[:notice] = "#{@event.name} was successfully edited."
      redirect_to session.delete(:return_to)
    else
      flash.now[:warning] = "You have not filled out all required fields"
      render :edit
    end
  end
  
  def confirm
    @event = Event.find(params[:event_id])
    @event.confirm
    flash[:notice] = "Event Approved"
    redirect_to admin_unapproved_events_path
  end

  def destroy
    session[:return_to] ||= request.referer
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Event Destroyed"
    redirect_to session.delete(:return_to)
      
  end
end
