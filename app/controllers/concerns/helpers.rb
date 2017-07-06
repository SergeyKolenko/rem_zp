module Helpers
  extend ActiveSupport::Concern

  def verify_admin_roles
    unless current_user.role_name == 'super_admin' || current_user.role_name == 'moderator'
      redirect_to admin_dashboard_path
      flash[:danger] = t('admin.wrong_rules')
    end
  end
end
