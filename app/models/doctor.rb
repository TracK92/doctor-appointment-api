class Doctor < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments, foreign_key: :user_id
end
