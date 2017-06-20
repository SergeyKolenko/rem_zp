module Admin
  class AdminController < ActionController::Base
    protect_from_forgery with: :exception
    layout 'admin'

    # before_action :authenticate_user!
    # before_action :verify_role!

    def after_sign_in_path_for(resource)
      admin_dashboard_path
    end

    private
    def verify_role!
      if current_user.role_name == 'simple_user'
        redirect_to root_path, flash: { error: 'У вас нет прав.' } and return
      end
    end
  end
end
