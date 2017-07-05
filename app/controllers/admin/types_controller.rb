class Admin::TypesController < Admin::AdminController
  load_and_authorize_resource
  before_action :set_type, only: [:update, :destroy]

  def index
    @types = Type.all.page(params[:page]).per(10)
  end

  def create
    @type = Type.new(type_params)
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

  private
  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :code)
  end

end
