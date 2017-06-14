class Region < ApplicationRecord
  has_many :cities
  has_many :proposals
  has_and_belongs_to_many :agencies

  validates :name, presence: true, uniqueness: true
end
