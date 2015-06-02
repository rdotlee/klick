class SectionsController < ApplicationController
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new
    @section.name = params[:name]

    if @section.save
      redirect_to "/sections", :notice => "Section created successfully."
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    @section.name = params[:name]

    if @section.save
      redirect_to "/sections", :notice => "Section updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @section = Section.find(params[:id])

    @section.destroy

    redirect_to "/sections", :notice => "Section deleted."
  end
end
