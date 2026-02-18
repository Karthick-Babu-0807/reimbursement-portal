class User < ApplicationRecord
  has_secure_password

  has_one :employee, dependent: :destroy

  enum role: { employee: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
