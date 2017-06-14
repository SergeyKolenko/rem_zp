class Agency < ApplicationRecord
  belongs_to :director, class_name: 'User'
  has_many :users
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :districts, optional: true

  mount_uploader :logo, AgencyLogoUploader

  validates :name, :postal_address, :phisical_address, :approved, :regions, presence: true
  validates :director, presence: true, if: Proc.new { |agency| %w(agency_director).include? agency.director.role.name }
  validates :users, presence: true, if: Proc.new { |agency| %w(agent).include? agency.user.role.name }
  validates :city, presence: true, inclusion: { in: Proc.new { |agency| agency.regions.map(&:cities) } }
  validates :districts, presence: true, inclusion: { in: Proc.new { |agency| agency.cities.map(&:districts) } }
end
