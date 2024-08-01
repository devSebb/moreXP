class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.includes(:job)
  end

  def create
    @job = Job.find(params[:job_id])
    current_user.bookmarks.find_or_create_by(job: @job)
    redirect_to @job, notice: 'Bookmark added successfully.'
  end

  def destroy
    @job = Job.find_by(id: params[:job_id]) # Ensure this is correctly used
    if @job
      bookmark = current_user.bookmarks.find_by(job: @job)
      bookmark&.destroy
      redirect_to @job, notice: 'Bookmark removed successfully.'
    else
      redirect_to bookmarks_path, alert: 'Job not found.'
    end
  end
end
