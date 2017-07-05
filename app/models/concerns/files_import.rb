module FilesImport
  extend ActiveSupport::Concern
  require 'roo'

  module ClassMethods

    def files_import(file, model, parent = nil)
      case File.extname(file.original_filename)
        when '.csv' then csv_import(file, model, parent)
        when '.json' then json_import(file, model, parent)
        when '.xlsx' then xlsx_import(file, model, parent)
        when '.xls' then xls_import(file, model, parent)
        when '.xml' then xml_import(file, model, parent)
      end
    end

    def csv_import(file, model, parent)
      require 'csv'
      CSV.foreach(file.path, headers: true) do |row|
        row << parent if parent.present?
        model.create! row.to_hash
      end
    end

    def json_import(file, model, parent)
      require 'oj'
      json = Oj.load(File.read(file.path))
      json.each do |row|
        row.merge!({ parent[0] => parent[1] }) if parent.present?
        model.create! row.to_hash
      end
    end

    def xlsx_import(file, model, parent)
      spreadsheet = Roo::Excelx.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model, parent)
    end

    def xls_import(file, model, parent)
      spreadsheet = Roo::Excel.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model, parent)
    end

    def xml_import(file, model, parent)
      spreadsheet = Roo::Excel2003XML.new(file.path)
      xls_xlsx_xml_import(spreadsheet, model, parent)
    end

    def xls_xlsx_xml_import(spreadsheet, model, parent)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        row.merge!({ parent[0] => parent[1] }) if parent.present?
        selected_model = model.find_by_id(row['code']) || new
        selected_model.attributes = row
        selected_model.save!
      end
    end
  end
end