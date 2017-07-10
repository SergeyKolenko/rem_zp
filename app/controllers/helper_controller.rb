class HelperController < ApplicationController

  def cities_for_region
    region_ids = params[:region_ids] || params[:region_id] || []
    cities = City.where(region_id: region_ids)
    render json: { cities: cities }, status: :ok
  end

  def districts_for_city
    city_ids = params[:city_ids] || params[:city_id] || []
    districts = District.where(city_id: city_ids)
    render json: { districts: districts }, status: :ok
  end

end