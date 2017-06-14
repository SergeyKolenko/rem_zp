class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :agency, optional: true
  has_many :proposals, foreign_key: :author_id
  has_many :agencies, foreign_key: 'director_id'

  validates :first_name, :last_name, :role, presence: true
  validates :agency, presence: true, if: Proc.new { |u| %w(agent agency_director).include? u.role.name }
  validates :agency, absence: true, unless: Proc.new { |u| %w(agent agency_director).include? u.role.name }
end
