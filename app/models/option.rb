class Option < ApplicationRecord
  include CodeValidations
  include SortingColumns

  has_and_belongs_to_many :categories
  has_many :option_values

  translates :name, :unit
  attribute :name, :string
  attribute :unit, :string

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
