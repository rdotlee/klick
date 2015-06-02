class EventTypesController < ApplicationController
  def index
    @event_types = EventType.all
  end

  def show
    @event_type = EventType.find(params[:id])
  end

  def new
    @event_type = EventType.new
  end

  def create
    @event_type = EventType.new
    @event_type.name = params[:name]
    @event_type.description = params[:description]

    if @event_type.save
      redirect_to "/event_types", :notice => "Event type created successfully."
    else
      render 'new'
    end
  end

  def edit
    @event_type = EventType.find(params[:id])
  end

  def update
    @event_type = EventType.find(params[:id])

    @event_type.name = params[:name]
    @event_type.description = params[:description]

    if @event_type.save
      redirect_to "/event_types", :notice => "Event type updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event_type = EventType.find(params[:id])

    @event_type.destroy

    redirect_to "/event_types", :notice => "Event type deleted."
  end
end
