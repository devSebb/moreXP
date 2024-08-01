class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    set_user.update(user_params)
    set_user.save!
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :location, :password, :password_confirmation, :current_password)
  end

end
