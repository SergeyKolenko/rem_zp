class City < ApplicationRecord
  belongs_to :region
  has_many :districts

  validates :name, :region_id, presence: true
end
