module SortingColumns
  extend ActiveSupport::Concern

  included do
    scope :sorting, -> (field_name = 'created_at', order_type = 'asc') do
      column = self.column_names.include?(field_name) ? field_name : 'created_at'
      sort = %w(asc desc).include?(order_type) ? order_type : 'asc'
      order %Q(#{field_name} #{order_type})
    end
  end
end