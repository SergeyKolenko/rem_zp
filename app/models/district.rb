class District < ApplicationRecord
  belongs_to :city
  has_many :proposals
  has_and_belongs_to_many :agencies, optional: true

  validates :name, :city, presence: true
end
