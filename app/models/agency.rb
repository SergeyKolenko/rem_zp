class Agency < ApplicationRecord
  belongs_to :director, class_name: 'User', inverse_of: 'owned_agency'
  has_many :users
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :districts, optional: true

  mount_uploader :logo, AgencyLogoUploader

  validates :name, :postal_address, :phisical_address, presence: true
  validates :director, inclusion: { in: :valid_users }
  # FIXME: Нужно обжумать целесообразность этих валидаций.
  # validates :users, presence: true, if: Proc.new { |agency| %w(agent).include? agency.user.role.name }
  # validates :city, presence: true, inclusion: { in: Proc.new { |agency| agency.regions.map(&:cities) } }
  # validates :districts, presence: true, inclusion: { in: Proc.new { |agency| agency.cities.map(&:districts) } }
  validates :phone, format: { with: /[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}/,
                              message: I18n.t('shared.wrong_phone') }

  private
  def valid_users
    Role.agency_director.try(:users) || []
  end
end
