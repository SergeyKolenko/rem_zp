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
    case File.extname(file.original_filename)
      when '.csv' then csv_import(file, City, parent)
      when '.json' then json_import(file, City, parent)
      when '.xlsx' then xlsx_import(file, City, parent)
      when '.xls' then xls_import(file, City, parent)
      when '.xml' then xml_import(file, City, parent)
    end
  end
end
