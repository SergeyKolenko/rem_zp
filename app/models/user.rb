class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :agency, optional: true
  has_many :proposals, foreign_key: :author_id
  has_one :owned_agency, class_name: 'Agency', foreign_key: :director_id, inverse_of: 'director'
  accepts_nested_attributes_for :owned_agency

  delegate :name, to: :role, prefix: true

  validates :first_name, :last_name, :role, presence: true
  validates :agency, presence: true, if: Proc.new { |u| %w(agent).include? u.role_name }
  validates :agency, absence: true, unless: Proc.new { |u| %w(agent).include? u.role_name }
  validates :owned_agency, presence: true, if: Proc.new { |u| %w(agency_director).include? u.role_name }
  validates :owned_agency, absence: true, unless: Proc.new { |u| %w(agency_director).include? u.role_name }
  validates :phone, format: { with: /[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}/,
                              message: 'Неверный формат номера' }

  before_create :set_default_role, if: Proc.new { |u| %w(super_admin agent moderator).include? u.role_name }

  def set_default_role
    self.role = Role.simple_user
  end
end
