class Proposal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  belongs_to :region
  belongs_to :city
  belongs_to :district

  mount_uploaders :images, ItemUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 100, maximum: 5000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :promo_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :currency, presence: true, inclusion: { in: Settings.currencies }
  validates :street, allow_nil: true, length: { minimum: 3, maximum: 30 }
  validates :region, presence: true
  validates :city, presence: true, inclusion: { in: Proc.new { |proposal| proposal.region.try(:cities) } }
  validates :district, inclusion: { in: Proc.new { |proposal| proposal.city.try(:districts) } }, allow_nil: true
end
