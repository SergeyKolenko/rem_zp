class Type < ApplicationRecord
  include CodeValidations

  has_and_belongs_to_many :proposals

  translates :name

  validates :name, presence: true, uniqueness: true
end
