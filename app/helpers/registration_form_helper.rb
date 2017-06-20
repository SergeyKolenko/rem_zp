module RegistrationFormHelper

  def roles_ids_for_sign_up
    # TODO: ADD CACHE!
    {
        simple_user: Role.simple_user.id,
        agency_director: Role.agency_director.id,
        realtor: Role.realtor.id
    }
  end
end