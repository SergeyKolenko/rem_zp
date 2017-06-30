class Category < ApplicationRecord
  has_many :proposals
  paginates_per 10

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }

  default_scope { order(weight: :desc) }
end
