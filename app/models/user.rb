class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :agency

  validates :first_name, :last_name, :agency, presence: true
  validates_associated :agency, if: Proc.new {|u| u.role == 'agent' && u.role == 'agency_director'}
end
