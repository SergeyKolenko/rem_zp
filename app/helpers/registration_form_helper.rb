module RegistrationFormHelper

  def roles_ids_for_sign_up
    Rails.cache.fetch('roles_ids_for_sign_up', expired_at: 24.hours) do
      {
          simple_user: Role.simple_user.id,
          agency_director: Role.agency_director.id,
          realtor: Role.realtor.id
      }
    end
  end
end