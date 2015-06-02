class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new
    @program.name = params[:name]

    if @program.save
      redirect_to "/programs", :notice => "Program created successfully."
    else
      render 'new'
    end
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])

    @program.name = params[:name]

    if @program.save
      redirect_to "/programs", :notice => "Program updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @program = Program.find(params[:id])

    @program.destroy

    redirect_to "/programs", :notice => "Program deleted."
  end
end
