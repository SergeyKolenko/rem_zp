class Role < ApplicationRecord
  has_many :users

  validates :name, presence: true, inclusion: %w(super_admin agency_director agent realtor simple_user)
end
