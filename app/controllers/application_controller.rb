class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role_id, :phone,
                                                       agency_attributes: [:name, :logo, :postal_address,
                                                                           :phisical_address,
                                                                           :description, :approved,
                                                                           :director_id, :phone
                                                       ]])
  end
end
