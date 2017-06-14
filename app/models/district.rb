class District < ApplicationRecord
  belongs_to :city
  has_many :proposals

  validates :name, :city, presence: true
end
