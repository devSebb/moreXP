class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @jobs = @jobs.where("title ILIKE ?", "%#{params[:title]}%") if params[:title].present?
    @jobs = @jobs.where("location ILIKE ?", "%#{params[:location]}%") if params[:location].present?
    @jobs = @jobs.where(industry: params[:industry]) if params[:industry].present?
    @jobs = @jobs.where("price <= ?", params[:price_range]) if params[:price_range].present?

    if params[:tags].present?
      tags = Array(params[:tags]).reject(&:blank?)
      @jobs = @jobs.where("tags && ARRAY[?]::text[]", tags) if tags.any?
    end

    @jobs = @jobs.page(params[:page]).per(12)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
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

    # Parse tags if present
    if params[:job][:tags].present?
      @job.tags = JSON.parse(params[:job][:tags])
    end

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
