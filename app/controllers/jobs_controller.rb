class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company, :description, :location, :category))
    redirect_to @job
  end


end
