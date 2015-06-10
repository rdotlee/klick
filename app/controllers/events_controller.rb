class EventsController < ApplicationController
  def index
    @events = Event.order("date ASC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.description = params[:description]
    @event.event_type_id = params[:event_type_id]
    @event.date = params[:date]
    @event.time = params[:time]
    @event.location_id = params[:location_id]
    @event.count_registration = params[:count_registration]
    @event.group_size = params[:group_size]

    if @event.save
      redirect_to "/events", :notice => "Event created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.description = params[:description]
    @event.event_type_id = params[:event_type_id]
    @event.date = Chronic.parse(params[:date])
    @event.time = params[:time]
    @event.location_id = params[:location_id]
    @event.count_registration = params[:count_registration]
    @event.group_size = params[:group_size]

    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
