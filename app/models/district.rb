class District < ApplicationRecord
  belongs_to :city

  validates :name, :city, presence: true
end
