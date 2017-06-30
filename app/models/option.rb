class Option < ApplicationRecord
  include CodeValidations

  has_and_belongs_to_many :categories
  has_many :option_values

  translates :name, :unit
  attribute :name, :unit

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
