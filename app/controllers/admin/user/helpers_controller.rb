class Admin::User::HelpersController < Admin::AdminController
  include Helpers
  before_action :verify_admin_roles
  before_action :set_user

  def sent_confirmation_instruction
    if @user.send_confirmation_instructions
      flash[:success] = t('admin.users.confirmation_sent')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  def reset_password
    if @user.send_reset_password_instructions
      flash[:success] = t('admin.users.password_reset')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  def block_user
    if @user.block_user
      flash[:success] = t('admin.users.blocked')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  def unblock_user
    if @user.unblock_user
      flash[:success] = t('admin.users.unblocked')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end