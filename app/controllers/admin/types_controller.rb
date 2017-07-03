class Admin::TypesController < Admin::AdminController
  before_action :get_type, only: [:update, :destroy]

  def index
    @types = Type.all.page(params[:page]).per(10)
  end

  def create
    @type = Type.new(region_params)
    @type.save!
    flash[:success] = 'Тип создан!'
    redirect_to admin_types_path
  end

  def update
    @type.update_attributes(type_params)
    flash[:success] = 'Тип обновлен'
    redirect_back(fallback_location: admin_types_path)
  end

  def destroy
    @type.destroy
    flash[:success] = 'Тип удален'
    redirect_back(fallback_location: admin_types_path)
  end

  # def import
  #   Type.import(params[:file])
  #   redirect_to admin_types_path, notice: 'Данные загружены'
  # rescue NoMethodError, ActiveRecord::RecordInvalid => exception
  #   show_errors(exception)
  # end

  private

  def get_type
    @type = Type.find_by(id: params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :code)
  end

  def show_errors(exception)
    redirect_to admin_types_path
    flash[:error] = exception
  end
end
