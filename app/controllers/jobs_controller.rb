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

  def add_to_applications
    job = Job.find(params[:id])
    current_user.applications.create(job: job)

  end

  def remove_from_applications
    @application = current_user.applications.find_by(job_id: params[:id])

    if @application.destroy
      flash[:notice] = 'Job successfully removed from applications.'
    else
      flash[:alert] = 'Failed to remove job from applications.'
    end

    redirect_to jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :company_name, :description, :start_date, :end_date, :price, :location, :time_commitment)
  end
end
