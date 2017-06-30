class Category < ApplicationRecord
  include CodeValidations

  has_many :proposals
  has_and_belongs_to_many :options
  translates :name
  attribute :name

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
