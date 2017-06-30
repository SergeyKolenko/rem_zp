class Region < ApplicationRecord
  include FilesImport
  include CodeValidations

  has_many :cities
  has_many :proposals
  has_and_belongs_to_many :agencies

  translates :name
  attribute :name

  validates :name, presence: true, uniqueness: true

  def self.import(file)
    case File.extname(file.original_filename)
    when '.csv' then csv_import(file, Region)
    when '.json' then json_import(file, Region)
    when '.xlsx' then xlsx_import(file, Region)
    when '.xls' then xls_import(file, Region)
    when '.xml' then xml_import(file, Region)
    end
  end
end



