class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!
  attr_accessor :password, :password_confirmation, :current_password

  def show; end

  def edit; end

  def update
    set_user.update(user_params)
    if set_user.save!
      redirect_to user_path, notice: 'Details saved.'
    else
      redirect_to user_path, notice: 'Something went wrong'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path(current_user), notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :location, :password, :password_confirmation, :current_password)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
