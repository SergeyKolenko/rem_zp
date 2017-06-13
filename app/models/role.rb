class Role < ApplicationRecord
  has_many :user

  validates :first_name, :status, presence: true
  validates :last_name, :status, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/,
            message: 'is invalid.' }, if: 'email.present?'

  validates :email, uniqueness: true

end
