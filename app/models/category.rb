class Category < ApplicationRecord
  has_many :proposals

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }
end
