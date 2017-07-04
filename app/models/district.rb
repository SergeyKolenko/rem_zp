class District < ApplicationRecord
  include FilesImport
  include CodeValidations

  belongs_to :city
  has_many :proposals
  has_and_belongs_to_many :agencies, optional: true

  translates :name
  attribute :name, :string

  validates :name, :city, presence: true

  def self.import(file, city_id)
    parent = ['city_id', city_id]
    files_import(file, District, parent)
  end
end
