class JobsController < ApplicationController
  def index
    @jobs = Job.all
    if params[:title].present?
      @jobs = Job.where("title ilike ? ", "%#{params[:title]}%")
    end
    if params[:location].present?
      @jobs = @jobs.where("location ILIKE ?", "%#{params[:location]}%")
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
    params.require(:job).permit(:title, :company_name, :description, :start_date, :end_date, :price, :location, :time_commitment, :industry)
  end
end
