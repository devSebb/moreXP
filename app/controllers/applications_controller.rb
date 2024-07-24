class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # this is the 'cart'
    @applications = current_user.applications
  end

  def create
    # to save a job to the 'cart' or 'index'
    @application = Application.new(application_params)
    @application.user = current_user

    if @application.save
      respond_to do |format|
        format.html {
          redirect_to jobs_path(company_name: params[:application][:company_name]),
          notice: 'Job has been saved'
        }
        format.js # This will render create.js.erb
      end
    else
      flash[:alert] = 'Job was not saved.' + @application.errors.full_messages.join(', ')
      redirect_to tools_path(company_name: params[:application][:company_name])
    end
  end

  private

  def application_params
    params.require(:application).permit(:job_id, :company_name)
  end
end
