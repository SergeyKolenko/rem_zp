class Role < ApplicationRecord

  NAMES = %w(super_admin agency_director agent realtor simple_user moderator)

  has_many :users

  validates :name, presence: true, inclusion: NAMES


  NAMES.each do |name|
    define_singleton_method(name) do
      Role.find_by_name name
    end
  end

  def available_for_sign_up?
    %w(realtor simple_user agency_director).include? name
  end

end
