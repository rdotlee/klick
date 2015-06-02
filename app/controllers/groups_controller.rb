class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    @group.event_id = params[:event_id]

    if @group.save
      redirect_to "/groups", :notice => "Group created successfully."
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    @group.event_id = params[:event_id]

    if @group.save
      redirect_to "/groups", :notice => "Group updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])

    @group.destroy

    redirect_to "/groups", :notice => "Group deleted."
  end
end
