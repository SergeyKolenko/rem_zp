class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :agency, optional: true
  has_many :proposals, foreign_key: :author_id

  delegate :name, to: :role, prefix: true

  validates :first_name, :last_name, :role, presence: true
  validates :agency, presence: true, if: Proc.new { |u| %w(agent agency_director).include? u.role_name }
  validates :agency, absence: true, unless: Proc.new { |u| %w(agent agency_director).include? u.role_name }
  validates :phone, format: { with: /[0]\d[(39|50|63|66|67|68|91|92|93|94|95|96|97|98|99)]-\d{3}-\d{2}-\d{2}/,
                              message: 'Неверный формат номера' }
end
