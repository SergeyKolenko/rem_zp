class Type < ApplicationRecord
  include CodeValidations
  include SortingColumns
  include LocaleValidations

  has_and_belongs_to_many :proposals

  translates :name
  attribute :name, :string

  validates :name, presence: true, uniqueness: true

  # def has_translate?(locale)
  #  translations.map(&:locale).include?(locale.to_sym)
  # end
end