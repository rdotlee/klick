class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new
    @registration.user_id = params[:user_id]
    @registration.event_id = params[:event_id]
    @registration.attended = params[:attended]

    if @registration.save
      redirect_to "/registrations", :notice => "Registration created successfully."
    else
      render 'new'
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])

    @registration.user_id = params[:user_id]
    @registration.event_id = params[:event_id]
    @registration.attended = params[:attended]

    if @registration.save
      redirect_to "/registrations", :notice => "Registration updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @registration = Registration.find(params[:id])

    @registration.destroy

    redirect_to "/registrations", :notice => "Registration deleted."
  end
end
