class Region < ApplicationRecord
  has_many :cities
  has_many :proposals

  validates :name, presence: true
end
