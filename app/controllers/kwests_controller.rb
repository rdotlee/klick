class KwestsController < ApplicationController
  def index
    @kwests = Kwest.all
  end

  def show
    @kwest = Kwest.find(params[:id])
  end

  def new
    @kwest = Kwest.new
  end

  def create
    @kwest = Kwest.new
    @kwest.trip = params[:trip]
    @kwest.year = params[:year]

    if @kwest.save
      redirect_to "/kwests", :notice => "Kwest created successfully."
    else
      render 'new'
    end
  end

  def edit
    @kwest = Kwest.find(params[:id])
  end

  def update
    @kwest = Kwest.find(params[:id])

    @kwest.trip = params[:trip]
    @kwest.year = params[:year]

    if @kwest.save
      redirect_to "/kwests", :notice => "Kwest updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @kwest = Kwest.find(params[:id])

    @kwest.destroy

    redirect_to "/kwests", :notice => "Kwest deleted."
  end
end
