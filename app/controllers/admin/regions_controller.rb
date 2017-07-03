class Admin::RegionsController < Admin::AdminController
  before_action :get_region, only: [:update, :destroy]

  def index
    @regions = Region.all.page(params[:page]).per(10)
  end

  def create
    @region = Region.new(region_params)
    @region.save!
    flash[:success] = 'Регион был создан!'
    redirect_to admin_regions_path
  end

  def update
    @region.update_attributes(region_params)
    flash[:success] = 'Регион обновлен'
    redirect_back(fallback_location: admin_regions_path)
  end

  def destroy
    @region.destroy
    flash[:success] = 'Регион удален'
    redirect_back(fallback_location: admin_regions_path)
  end

  def import
    Region.import(params[:file])
    redirect_to admin_regions_path, notice: 'Данные загружены'
  rescue NoMethodError, ActiveRecord::RecordInvalid => exception
    show_errors(exception)
  end

  private

  def get_region
    @region = Region.find_by(id: params[:id])
  end

  def region_params
    params.require(:region).permit(:name)
  end

  def show_errors(exception)
    redirect_to admin_regions_path
    flash[:error] = exception
  end
end
