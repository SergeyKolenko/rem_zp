class Admin::CitiesController < Admin::AdminController
  before_action :get_city, only: [:update, :destroy]

  def index
    if params[:region_id].present?
      @cities = City.where(region_id: params[:region_id]).page(params[:page]).per(10)
    else
      @cities = City.all.page(params[:page]).per(10)
    end
  end

  def create
    @city = City.new(cities_params)
    @city.save!
    flash[:success] = t('admin.cities.create_notice')
    redirect_to admin_cities_path
  end

  def update
    @city.update_attributes(cities_params)
    flash[:success] = t('admin.cities.update_notice')
    redirect_back(fallback_location: admin_cities_path)
  end

  def destroy
    @city.destroy
    flash[:success] = t('admin.cities.destroy_notice')
    redirect_back(fallback_location: admin_cities_path)
  end

  def import
    City.import(params[:file], params[:region_id])
    redirect_to admin_cities_path, notice: t('shared.import_notice')
  rescue NoMethodError, ActiveRecord::RecordInvalid => exception
    show_errors(exception)
  end

  private

  def get_city
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
