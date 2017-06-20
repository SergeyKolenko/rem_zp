module RegistrationFormHelper

  def new_user_role(role)
    Role.find_by(name: role || 'simple_user').try(:id)
  end
end