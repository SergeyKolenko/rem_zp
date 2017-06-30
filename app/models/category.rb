class Category < ApplicationRecord
  include CodeValidations

  has_many :proposals
  translates :name

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
