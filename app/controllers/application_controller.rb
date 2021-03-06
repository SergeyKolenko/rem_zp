class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LocaleSwitch
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(*)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :first_name, :last_name, :role_id, :phone, :locale, :avatar_cache, owned_agency_attributes: [
        :director_id, :name, :logo, :phone, :postal_address, :phisical_address, :description, :approved, { city_ids: [] },
        { region_ids: [] }, { district_ids: [] }
    ]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :locale, :avatar,
                                                              :remove_avatar, :avatar_cache])
  end

  def current_ability
    current_user.ability
  end
end

