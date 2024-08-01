class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @applications = current_user.applications.includes(:job, :user)
  end

  def show
    @applications = current_user.applications.includes(:job, :user)
  end

  def create
    @application = Application.new(application_params)

    @application.applied_to = true

    @job = Job.find_by(id: @application.job_id)
    if @job.nil?
      redirect_to jobs_path, alert: "Job not found"
      return
    end

    if @application.save

      @applications = current_user.applications.where(applied_to: true)

      redirect_to job_path(@job), notice: 'Application submitted successfully.'
    else
      @job = Job.find(@application.job_id)
      render 'jobs/show'
    end
  end


  private

  def application_params
    params.require(:application).permit(:job_id, :user_id, :company_name, :resume, :cover_letter, :personal_message, :applied_to)
  end
end
