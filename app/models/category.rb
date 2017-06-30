class Category < ApplicationRecord
  has_many :proposals
  paginates_per 10

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
