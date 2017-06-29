module FilesImport
  extend ActiveSupport::Concern
  require 'csv'
  require 'oj'
  require 'roo'

  module ClassMethods

    def csv_import(file, model)
      CSV.foreach(file.path, headers: true) do |row|
        model.create! row.to_hash
      end
    end

    def json_import(file, model)
      json = Oj.load(File.read(file.path))
      json.each { |row| model.create! row.to_hash }
    end

    def xlsx_import(file, model)
      spreadsheet = Roo::Excelx.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model)
    end

    def xls_import(file, model)
      spreadsheet = Roo::Excel.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model)
    end

    def xml_import(file, model)
      spreadsheet = Roo::Excel2003XML.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model)
    end

    def xls_xlsx_xml_import(spreadsheet, model)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        selected_model = model.find_by_id(row['id']) || new
        selected_model.attributes = row.to_hash.slice(*column_names)
        selected_model.save!
      end
    end
  end
end