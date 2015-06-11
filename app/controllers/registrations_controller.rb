class RegistrationsController < ApplicationController
  def index
    if current_user.admin?
      @registrations = Registration.all
    else
      @registrations = Registration.where("user_id =?", current_user.id)
    end
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

  def register_for_event
    @registration = Registration.new
    @registration.user_id = params[:user_id]
    @registration.event_id = params[:event_id]
    @registration.attended = params[:attended]

    if @registration.save
      redirect_to "/registrations", :notice => "Registration created successfully."
    else
      redirect_to "/events", :alert => "Registrations failed, please try again"
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

  def assign_groups_for_event
    e = Event.find(params[:event_id])
    r = e.registrations
    gSize = e.group_size
    #Determine # of groups to be created
    if r.count/gSize > 0
      num_groups= r.count/gSize

      if r.count % gSize != 0
        num_groups+=1
      end

      if e.groups.count == 0
      #Create groups
        num_groups.times do |i|
          g = Group.new
          g.event_id = e.id
          g.save
          puts 'Created group'
        end
      else
        diff = num_groups - e.groups.count
        puts diff.to_s+'this is diff'
        puts num_groups .to_s+'this is num_groups'
        puts e.groups.count.to_s+'this is event count'
        if diff > 0
          diff.times do |i|
            g = Group.new
            g.event_id = e.id
            g.save
            puts 'Created group'
          end
        else
          diff= diff*-1
          diff.times do |i|
            g= e.groups.first
            g.destroy
            puts 'Destroyed group'
          end
        end
      end

      #Assign groups to registrations
      r.each do |registration|
        ag = e.groups.order("RANDOM()").first
        registration.group_id = ag.id
        registration.save
      end
      redirect_to "/events/"+e.id.to_s, :notice => "Groups successfully assigned."
      #Else redirect and do not create groups
    else
      redirect_to "/events/"+e.id.to_s, :alert => "Not enough registered to assign groups, please try later"
    end
  end

  def destroy
    @registration = Registration.find(params[:id])

    @registration.destroy

    redirect_to "/registrations", :notice => "Registration deleted."
  end
end
