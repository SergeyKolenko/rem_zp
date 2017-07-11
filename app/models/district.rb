class District < ApplicationRecord
  include FilesImport
  include CodeValidations
  include SortingColumns

  belongs_to :city
  has_many :proposals
  has_and_belongs_to_many :agencies, optional: true

  translates :name
  attribute :name, :string

  validates :name, :city, presence: true

end
