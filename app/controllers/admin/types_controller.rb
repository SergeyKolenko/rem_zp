class Admin::TypesController < Admin::AdminController
  load_and_authorize_resource
  before_action :set_type, only: [:update, :destroy]

  def index
    @types = Type.all.page(params[:page]).per(10)
  end

  def create
    @type = Type.new(type_params)
    if @type.save
      flash[:success] = t('admin.types.create_notice')
    else
      flash[:danger] = @type.errors.full_messages
    end
    redirect_to admin_types_path
  end

  def update
    if @type.update(type_params)
      flash[:success] = t('admin.types.update_notice')
    else
      flash[:danger] = @type.errors.full_messages
    end
    redirect_to admin_types_path
  end

  def destroy
    if @type.destroy
      flash[:success] = t('admin.types.update_notice')
    else
      flash[:danger] = @type.errors.full_messages
    end
    redirect_to admin_types_path
  end

  private
  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :code)
  end

end
