class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.create(params.require(:job).permit(:title, :company_id, :description, :location, :category, :featured))
    redirect_to @job
  end


end
