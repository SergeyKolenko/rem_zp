module RolesHelper
  def create_roles
    Role::NAMES.each { |rn| Role.find_or_create_by name: rn }
  end
end