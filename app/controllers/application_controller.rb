class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role_id, :phone,
                                                       owned_agency_attributes: [:director_id, :name, :logo, :phone,
                                                                                 :postal_address, :phisical_address,
                                                                                 :description, :approved,
                                                                                 :city_ids, :region_ids, :district_ids]
    ])
  end
end

