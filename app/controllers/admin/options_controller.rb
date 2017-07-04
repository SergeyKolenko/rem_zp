class Admin::OptionsController < Admin::AdminController
  before_action :set_option, only: [:update, :destroy]

  def index
    @options = Option.all.page(params[:page]).per(10)
  end

  def create
    @option = Option.new(option_params)
    @option.save!
    flash[:success] = 'Опция создана!'
    redirect_to admin_options_path
  end

  def update
    @option.update_attributes(option_params)
    flash[:success] = 'Опция обновлена'
    redirect_back(fallback_location: admin_options_path)
  end

  def destroy
    @option.destroy
    flash[:success] = 'Опция удалена'
    redirect_back(fallback_location: admin_options_path)
  end

  private
  def set_option
    @option = Option.find_by(id: params[:id])
  end

  def option_params
    params.require(:option).permit(:name, :code, :unit)
  end

end
