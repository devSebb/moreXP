class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.includes(:job)
  end

  def create
    @job = Job.find(params[:job_id])
    bookmark = current_user.bookmarks.find_or_create_by(job: @job)

    if bookmark.persisted?
      render json: { status: 'success', message: 'Bookmark added successfully.' }, status: :ok
    else
      render json: { status: 'error', message: 'Failed to add bookmark.' }, status: :unprocessable_entity
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(job_id: params[:id])

    if bookmark&.destroy
      render json: { status: 'success', message: 'Bookmark removed successfully.' }, status: :ok
    else
      render json: { status: 'error', message: 'Failed to remove bookmark.' }, status: :unprocessable_entity
    end
  end
end
