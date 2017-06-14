class Option < ApplicationRecord
  has_and_belongs_to_many :categories

  validates :name, presence: true, length: {minimum: 2, maximum: 20}
end
