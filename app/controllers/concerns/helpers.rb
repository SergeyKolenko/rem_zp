module Helpers
  extend ActiveSupport::Concern

  def verify_admin_roles
    unless %w(super_admin moderator).include? current_user.role_name
      flash[:danger] = t('admin.wrong_rules')
      redirect_to admin_dashboard_path
    end
  end
end
