class District < ApplicationRecord
  include CodeValidations

  belongs_to :city
  has_many :proposals
  has_and_belongs_to_many :agencies, optional: true

  translates :name
  attribute :name

  validates :name, :city, presence: true
end
