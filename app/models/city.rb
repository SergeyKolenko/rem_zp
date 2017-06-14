class City < ApplicationRecord
  belongs_to :region
  has_many :districts
  has_many :proposals

  validates :name, :region, presence: true
end
