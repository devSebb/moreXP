class JobsController < ApplicationController
  def index
    if params[:title].present?
      @jobs = Job.where("title ilike ? ", "%#{params[:title]}%")
    else
      @jobs = Job.all
    end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to jobs_path, notice: 'Job created successfully.'
    else
      render :new
    end
  end


  private

  def job_params
    params.require(:job).permit(:title, :company_name, :description, :start_date, :end_date, :price, :location, :time_commitment)
  end
end
