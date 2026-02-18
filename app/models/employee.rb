class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :user, dependent: :destroy
  has_many :bills, dependent: :destroy

  validates :first_name, :last_name, :designation, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end