class User < ApplicationRecord
  has_many :appointments
  has_many :doctors

  # validations
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true
end
