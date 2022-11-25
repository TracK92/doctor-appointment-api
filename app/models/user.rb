class User < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments, foreign_key: :doctor_id
end
