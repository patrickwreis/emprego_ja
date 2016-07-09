class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(params.require(:job).permit(:title, :company_id, :description, :location, :category, :featured))
    if @job.save
      redirect_to @job
    else
      flash[:notice] = 'Não foi possível criar a vaga'
      @companies = Company.all
      render 'new'

    end
  end


end
