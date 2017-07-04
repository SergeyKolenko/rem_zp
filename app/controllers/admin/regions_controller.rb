class Admin::RegionsController < Admin::AdminController
  before_action :get_region, only: [:update, :destroy]

  def index
    @regions = Region.all.page(params[:page]).per(10)
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:success] = t('admin.regions.create_notice')
    else
      flash[:danger] = @region.errors.full_messages
    end
    redirect_to admin_regions_path
  end

  def update
    if @region.update(region_params)
      flash[:success] = t('admin.regions.update_notice')
    else
      flash[:danger] = @region.errors.full_messages
    end
    redirect_back(fallback_location: admin_regions_path)
  end

  def destroy
    if @region.destroy
      flash[:success] = t('admin.regions.destroy_notice')
    else
      flash[:danger] = @region.errors.full_messages
    end
    redirect_back(fallback_location: admin_regions_path)
  end

  def import
    Region.import(params[:file])
    redirect_to admin_regions_path, notice: t('shared.import_notice')
  rescue NoMethodError, ActiveRecord::RecordInvalid => exception
    show_errors(exception)
  end

  private

  def get_region
    @region = Region.find_by(id: params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :code)
  end

  def show_errors(exception)
    redirect_to admin_regions_path
    flash[:error] = exception
  end
end
