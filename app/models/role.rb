class Role < ApplicationRecord
  has_many :users, conditions: {role: 'agent'}

  validates :name, presence: true, inclusion: %w(super_admin agency_director agent realtor simple_user)
end
