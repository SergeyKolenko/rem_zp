module Admin
  class AdminController < ActionController::Base
    protect_from_forgery with: :exception
    include LocaleSwitch
    layout 'admin'

    before_action :authenticate_user!
    before_action :verify_role!

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path, alert: exception.message
    end

    def after_sign_in_path_for(*)
      admin_path
    end

    private
    def verify_role!
      if current_user.role_name == 'simple_user'
        redirect_to root_path, flash: { error: t('admin.wrong_rules') } and return
      end
    end
  end
end
