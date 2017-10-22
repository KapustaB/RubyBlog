module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :new]
    layout 'admin/application'

    def new
    end

    def show
    end

    def edit
    end

    def destroy
      @user.destroy
      flash[:notice] = 'User removed.'
      redirect_to admin_users_path
    end

    def index
      @users = User.all
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :email, :admin)
    end
  end
end
