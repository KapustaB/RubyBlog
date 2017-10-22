class AdminController < ApplicationController
  layout :layout_by_user

  def layout_by_user
    if current_user.present?
      if current_user.has_role? :admin
        "layouts/admin/application"
      else
        "layouts/application"
      end
    end
  end
end
