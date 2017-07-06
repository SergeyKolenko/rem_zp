class Category < ApplicationRecord
  include CodeValidations

  has_many :proposals
  paginates_per 10
  has_and_belongs_to_many :options
  translates :name
  attribute :name, :string

  validates :name, :weight, presence: true
  validates :weight, numericality: { greater_than: 0 }

  scope :sorting, -> (field_name = 'created_at', order_type = 'asc') do
    column = self.column_names.include?(field_name) ? field_name : 'created_at'
    sort = %w(asc desc).include?(order_type) ? order_type : 'asc'
    order %Q(#{field_name} #{order_type})
  end

end
