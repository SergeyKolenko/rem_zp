class Region < ApplicationRecord
  include FilesImport
  include CodeValidations

  has_many :cities
  has_many :proposals
  has_and_belongs_to_many :agencies

  paginates_per 10
  translates :name
  attribute :name, :string

  validates :name, presence: true, uniqueness: true

end



