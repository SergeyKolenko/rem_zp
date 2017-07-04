class Admin::CitiesController < Admin::AdminController
  before_action :set_city, only: [:update, :destroy]

  def index
    cities = params[:region_id].present? ? City.where(region_id: params[:region_id]) : City.all
    @cities = cities.page(params[:page]).per(10)
  end

  def create
    @city = City.new(cities_params)
    if @city.save
      flash[:success] = t('admin.cities.create_notice')
    else
      flash[:danger] = @city.errors.full_messages
    end
    redirect_to admin_cities_path
  end

  def update
    if @city.update(cities_params)
      flash[:success] = t('admin.cities.update_notice')
    else
      flash[:danger] = @city.errors.full_messages
    end
    redirect_back(fallback_location: admin_cities_path)
  end

  def destroy
    if @city.destroy
      flash[:success] = t('admin.cities.destroy_notice')
    else
      flash[:danger] = @city.errors.full_messages
    end
    redirect_back(fallback_location: admin_cities_path)
  end

  def import
    City.import(params[:file], params[:region_id])
    redirect_to admin_cities_path, notice: t('shared.import_notice')
  rescue NoMethodError, ActiveRecord::RecordInvalid => exception
    show_errors(exception)
  end

  private

  def set_city
    @city = City.find_by(id: params[:id])
  end

  def cities_params
    params.require(:city).permit(:name, :region_id, :code)
  end

  def show_errors(exception)
    redirect_to admin_cities_path
    flash[:error] = exception
  end
end
