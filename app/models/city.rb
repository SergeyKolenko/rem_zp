class City < ApplicationRecord
  include FilesImport
  include CodeValidations

  belongs_to :region
  has_and_belongs_to_many :agencies
  has_many :districts
  has_many :proposals

  translates :name
  attribute :name, :string

  validates :name, :region, presence: true

  def self.import(file, region_id)
    parent = ['region_id', region_id]
    files_import(file, City, parent)
  end
end
