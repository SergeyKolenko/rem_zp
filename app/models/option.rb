class Option < ApplicationRecord

  has_and_belongs_to_many :categories
  has_many :option_values

  translates :name, :unit

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :code, presence: true, uniqueness: { scope: :unit },
            format: { with: /\A(?!_)[a-z_]+/, message: I18n.t('shared.errors.wrong_format') }
end
