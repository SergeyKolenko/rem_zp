class Region < ApplicationRecord
  include CodeValidations

  has_many :cities
  has_many :proposals
  has_and_belongs_to_many :agencies

  translates :name

  validates :name, presence: true, uniqueness: true
end
