class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:profile_image,:name,:introduction)
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(edit_user_path(current_user.id)) unless @user == current_user
  end
end
