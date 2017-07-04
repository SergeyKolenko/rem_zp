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
    case File.extname(file.original_filename)
      when '.csv' then csv_import(file, City, parent)
      when '.json' then json_import(file, City, parent)
      when '.xlsx' then xlsx_import(file, City, parent)
      when '.xls' then xls_import(file, City, parent)
      when '.xml' then xml_import(file, City, parent)
    end
  end
end
