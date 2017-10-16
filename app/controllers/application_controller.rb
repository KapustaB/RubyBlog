class ApplicationController < ActionController::Base
  protect_from_forgery only: [:create, :update]
  #skip_before_action :verify_authenticity_token
end
