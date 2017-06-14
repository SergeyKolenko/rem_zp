class Option < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :option_values

  validates :name, presence: true, length: {minimum: 2, maximum: 20}
end
