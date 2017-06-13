class Role < ApplicationRecord
  has_many :users, -> (user){where(role: 'agent')}

  validates :name, format: %w(super_admin agency_director agent realtor simple_user)
end
