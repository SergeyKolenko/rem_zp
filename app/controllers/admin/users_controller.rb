class Admin::UsersController < Admin::AdminController
  include Helpers
  before_action :verify_admin_roles
  before_action :set_user, except: [:index, :new]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_confirmation_instructions
      flash[:success] = t('admin.users.create_notice')
      redirect_to admin_users_path
    else
      flash[:danger] = @user.errors.full_messages
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('admin.users.update_notice')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  def destroy
    if @user.destroy
      flash[:success] = t('admin.users.destroy_notice')
    else
      flash[:danger] = @user.errors.full_messages
    end
    redirect_back(fallback_location: admin_users_path)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :locale, :avatar,
                                 :remove_avatar, :avatar_cache, :role)
  end
end
