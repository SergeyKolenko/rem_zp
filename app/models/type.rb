class Type < ApplicationRecord
  include CodeValidations
  include SortingColumns

  has_and_belongs_to_many :proposals

  translates :name
  attribute :name, :string

  validates :name, presence: true, uniqueness: true
end
