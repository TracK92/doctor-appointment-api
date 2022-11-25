class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  # validations

  validates :description, presence: true, length: { in: 3..150 }
  validates :date_of_appointment, presence: true
  validates :time_of_appointment, presence: true
end
