class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash[:notice] = 'Não foi possível criar a vaga'
      @companies = Company.all
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
     if @job.update(job_params)
      redirect_to @job
    else
      flash[:notice] = 'Não foi possível atualizar a vaga'
      @companies = Company.all
      render 'edit'
    end
  end

  def job_params
    params.require(:job).permit(:title, :company_id, :description, :location, :category, :featured)
  end

end
