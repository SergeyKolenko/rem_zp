class Category < ApplicationRecord
  include CodeValidations

  has_many :proposals
  paginates_per 10
  has_and_belongs_to_many :options
  translates :name
  attribute :name, :string

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }

  default_scope { order(weight: :desc) }
end
