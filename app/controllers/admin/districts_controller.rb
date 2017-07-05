class Admin::DistrictsController < Admin::AdminController
  before_action :set_district, only: [:update, :destroy]

  def index
    districts = params[:city_id].present? ? District.where(city_id: params[:city_id]) : District.all
    @districts = districts.page(params[:page]).per(10)
  end

  def create
    @district = District.new(districts_params)
    if @district.save
      flash[:success] = t('admin.districts.create_notice')
    else
      flash[:danger] = @district.errors.full_messages
    end
    redirect_to admin_districts_path
  end

  def update
    if @district.update(districts_params)
      @district[:success] = t('admin.districts.update_notice')
    else
      flash[:danger] = @district.errors.full_messages
    end
    redirect_back(fallback_location: admin_districts_path)
  end

  def destroy
    if @district.destroy
      flash[:success] = t('admin.districts.destroy_notice')
    else
      flash[:danger] = @district.errors.full_messages
    end
    redirect_back(fallback_location: admin_districts_path)
  end

  def import
    District.files_import(params[:file], District, ['city_id', params[:city_id]])
    redirect_to admin_districts_path, notice: t('shared.import_notice')
  rescue NoMethodError, ActiveRecord::RecordInvalid => exception
    show_errors(exception)
  end

  private

  def set_district
    @district = District.find_by(id: params[:id])
  end

  def districts_params
    params.require(:district).permit(:name, :city_id, :code)
  end

  def show_errors(exception)
    redirect_to admin_districts_path
    flash[:error] = exception
  end
end
