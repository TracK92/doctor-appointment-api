class Doctor < ApplicationRecord
  has_many :appointments, foreign_key: :doctor_id, dependent: :destroy

  # validations

  validates :name, presence: true, length: { in: 3..50 }
  validates :specialization, presence: true, length: { in: 3..50 }
  validates :photo, presence: true
end
