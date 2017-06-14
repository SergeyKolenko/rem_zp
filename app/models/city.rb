class City < ApplicationRecord
  belongs_to :region
  has_and_belongs_to_many :agencies
  has_many :districts
  has_many :proposals

  validates :name, :region, presence: true
end
