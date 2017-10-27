class Users::AboutController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :about, :email, :admin, :avatar, :last_sign_in_at, :current_sing_in_at)
  end
end
