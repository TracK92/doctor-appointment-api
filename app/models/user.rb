class User < ApplicationRecord
  has_many :appointments, foreign_key: :user_id, dependent: :destroy

  # validations
  validates :name, presence: true, length: { in: 3..50 }
end
