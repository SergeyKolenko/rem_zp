class Agency < ApplicationRecord
  belongs_to :director, class_name: 'User', inverse_of: 'owned_agency'
  has_many :users
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :districts, optional: true

  mount_uploader :logo, AgencyLogoUploader

  validate :cities_belongs_to_regions, :director_role

  validates :name, :postal_address, :phisical_address, presence: true
  #validates :director, inclusion: { in: :valid_users }
  validates :phone, format: { with: /\A[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}\z/,
                              message: I18n.t('shared.wrong_phone') }

  private

  def director_role
    if director.role != Role.agency_director
      errors.add(:director, I18n.t('shared.errors.invalid_user_role'))
    end
  end

  # def valid_users
  #   Role.agency_director.try(:users) || []
  # end

  def cities_belongs_to_regions
    unless regions.any? && cities.any? && (cities.map { |city| city.region.id } - region_ids).empty?
      errors.add(:cities, I18n.t('shared.errors.city_not_from_region'))
    end
  end
end
