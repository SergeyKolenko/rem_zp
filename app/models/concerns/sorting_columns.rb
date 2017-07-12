module SortingColumns
  extend ActiveSupport::Concern

  included do
    scope :sorting, -> (field_name = 'created_at', order_type = 'asc') do
      column = self.column_names.include?(field_name) ? field_name : 'id'
      sort = %w(asc desc).include?(order_type) ? order_type : 'asc'
      order column => sort
    end
  end
end