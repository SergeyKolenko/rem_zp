class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include SortingColumns
  devise :database_authenticatable, :async, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :agency, optional: true
  has_many :proposals, foreign_key: :author_id
  has_one :owned_agency, class_name: 'Agency', foreign_key: :director_id, inverse_of: 'director'
  accepts_nested_attributes_for :owned_agency

  delegate :name, to: :role, prefix: true

  mount_uploader :avatar, UsersAvatarUploader

  validates :first_name, :last_name, :role, presence: true
  validates :first_name, length: { minimum: 2, maximum: 20 }
  validates :last_name, length: { minimum: 2, maximum: 50 }
  validates :agency, presence: true, if: Proc.new { |u| %w(agent).include? u.role_name }
  validates :agency, absence: true, unless: Proc.new { |u| %w(agent).include? u.role_name }
  validates :phone, format: { with: /\A[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}\z/,
                              message: I18n.t('shared.wrong_phone') }

  before_create :set_default_role, if: Proc.new { |u| %w(super_admin agent moderator).include? u.role_name }

  def set_default_role
    self.role = Role.simple_user
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def ability
    @ability ||= Ability.new(self)
  end

  def active_for_authentication?
    super && !blocked?
  end

  def block_user
    update(blocked: true)
  end

  def unblock_user
    update(blocked: false)
  end
end
