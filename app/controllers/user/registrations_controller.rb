class User::RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    resource.build_owned_agency({}) if session[:role_id] == Role.agency_director.id
    yield resource if block_given?
    respond_with resource
  end

  def new_with_role
    role = Role.find(params[:id])
    redirect_to new_user_session_path, flash: {error: t('application.wrong_role')} and return unless role.available_for_sign_up?
    session[:role_id] = role.id
    redirect_to new_user_registration_path
  end

  def create
    build_resource(sign_up_params)

    resource.save
    session.delete(:role_id)
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
