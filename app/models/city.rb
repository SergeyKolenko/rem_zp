class City < ApplicationRecord
  belongs_to :region
  has_many :districts

  validates :name, :region, presence: true
end
