class Type < ApplicationRecord
  has_and_belongs_to_many :proposals

  validates :name, presence: true, uniqueness: true
end
