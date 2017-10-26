class ApplicationController < ActionController::Base
  protect_from_forgery only: [:create, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?
 # before_action :user_role_check
  #skip_before_action :verify_authenticity_token
  layout :layout_by_user

  def after_sign_in_path_for(resource)
    if current_user.admin?
       admin_posts_path
    else
       posts_path
      end
  end

  def configure_permitted_parameters
    update_attrs = [:email, :first_name, :last_name, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def layout_by_user
    if current_user.present?
      if current_user.admin?
      "layouts/admin/application"
    else
      "layouts/application"
    end
      end
  end


end
