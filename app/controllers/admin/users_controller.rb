module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :new, :add_role]
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

    def add_role
      #binding.pry
      set_user_role
      redirect_back(fallback_location: root_path)
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

    def set_user_role
      #binding.pry
      if params[:user][:roles].present?
        @user.add_role params[:user][:roles].to_sym
      else
        @user.delete_role@user.roles.first.name.to_sym
      end
    end
  end
end
