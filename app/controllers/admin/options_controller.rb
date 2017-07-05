class Admin::OptionsController < Admin::AdminController
  before_action :set_option, only: [:update, :destroy]

  def index
    @options = Option.all.page(params[:page]).per(10)
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      flash[:success] = t('admin.options.create_notice')
    else
      flash[:danger] = @option.errors.full_messages
    end
    redirect_to admin_options_path
  end

  def update
    if @option.update(option_params)
      flash[:success] = t('admin.options.update_notice')
    else
      flash[:danger] = @option.errors.full_messages
    end
    redirect_to admin_options_path
  end

  def destroy
    if @option.destroy
      flash[:success] = t('admin.options.destroy_notice')
    else
      flash[:danger] = @option.errors.full_messages
    end
    redirect_to admin_options_path
  end

  private
  def set_option
    @option = Option.find_by(id: params[:id])
  end

  def option_params
    params.require(:option).permit(:name, :code, :unit, category_ids: [])
  end

end
