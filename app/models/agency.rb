class Agency < ApplicationRecord
  belongs_to :director, class_name: 'User'
  has_many :users
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :districts, optional: true

  mount_uploader :logo, AgencyLogoUploader

  validates :name, :postal_address, :phisical_address, :regions, presence: true
  validates :director, presence: true, if: Proc.new { |agency| %w(agency_director).include? agency.director.role.name }
  # FIXME: Нужно обжумать целесообразность этих валидаций.
  # validates :users, presence: true, if: Proc.new { |agency| %w(agent).include? agency.user.role.name }
  # validates :city, presence: true, inclusion: { in: Proc.new { |agency| agency.regions.map(&:cities) } }
  # validates :districts, presence: true, inclusion: { in: Proc.new { |agency| agency.cities.map(&:districts) } }
  validates :phone, format: { with: /[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}/,
                              message: 'Неверный формат номера' }
end
