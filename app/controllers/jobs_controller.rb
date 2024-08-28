class JobsController < ApplicationController
  def index
    @jobs = Job.all
    if params[:title].present?
      @jobs = Job.where("title ilike ? ", "%#{params[:title]}%")
    end
    if params[:location].present?
      @jobs = @jobs.where("location ILIKE ?", "%#{params[:location]}%")
    end
    if params[:industry].present?
      @jobs = @jobs.where("industry ILIKE ?", "%#{params[:industry]}%")
    end
    @jobs = @jobs.where("price <= ?", params[:price_range].to_i) if params[:price_range].present?
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render :edit
    end
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

  def created
    @jobs = Job.where(user_id: current_user.id)
    @applications = Application.where(job_id: @jobs.pluck(:id))
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = 'Job was successfully deleted.'
    redirect_to jobs_path, status: :see_other
  end


  private

  def job_params
    params.require(:job).permit(:title, :company_name, :description, :start_date, :end_date, :price, :location, :time_commitment, :industry)
  end
end
