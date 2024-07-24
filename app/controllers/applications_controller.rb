class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # this is the 'cart'
    @applications = current_user.applications
  end

  def create
    @job = Job.find(params[:job_id])
    @application = Application.new(job: @job, user: current_user)

    if @application.save
      flash[:notice] = "Job added to applications successfully."
    else
      flash[:alert] = "Failed to add job to applications."
    end
  end


  private

  def application_params
    params.require(:application).permit(:job_id, :company_name)
  end
end
