class City < ApplicationRecord
  include FilesImport
  include CodeValidations
  include SortingColumns

  belongs_to :region
  has_and_belongs_to_many :agencies
  has_many :districts
  has_many :proposals

  translates :name
  attribute :name, :string

  validates :name, :region, presence: true

end
