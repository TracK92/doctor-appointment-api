require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:each) do
    @user = User.create(name: 'John Doe')
    @doctor = Doctor.create(name: 'Dr. John Doe', specialization: 'Pediatrics', photo: 'https://www.google.com', user_id: @user.id)
    @appointment = Appointment.create(date_of_appointment: '2024-01-01', time_of_appointment: '10:00', description: 'Checkup', user_id: @user.id, doctor_id: @doctor.id)
  end

  describe 'associations' do
    it 'should belong to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'should belong to doctor' do
      assc = described_class.reflect_on_association(:doctor)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it 'is not valid without a description' do
      @appointment.description = nil
      expect(@appointment).to_not be_valid
    end

    it 'is not valid with a description less than 3 characters' do
      @appointment.description = 'ab'
      expect(@appointment).to_not be_valid
    end

    it 'is not valid with a description more than 150 characters' do
      @appointment.description = 'a' * 151
      expect(@appointment).to_not be_valid
    end

    it 'is not valid without a date_of_appointment' do
      @appointment.date_of_appointment = nil
      expect(@appointment).to_not be_valid
    end

    it 'is not valid without a time_of_appointment' do
      @appointment.time_of_appointment = nil
      expect(@appointment).to_not be_valid
    end

    it 'is not valid with a time_of_appointment format different from HH:MM' do
      @appointment.time_of_appointment = '10:0'
      expect(@appointment).to_not be_valid
    end

    it 'is valid with a description between 3 and 150 characters' do
      @appointment.description = 'Knee pain'
      expect(@appointment).to be_valid
    end

    it 'is valid with a description between 3 and 150 characters' do
      @appointment.description = 'a' * 150
      expect(@appointment).to be_valid
    end

    it 'is valid with a time_of_appointment format of HH:MM' do
      appointment = Appointment.new(user: @user, doctor: @doctor, description: 'abc',
                                    date_of_appointment: '2024-01-01', time_of_appointment: '12:00')
      expect(appointment).to be_valid
    end

    it 'is not valid with a date_of_appointment in the past' do
      appointment = Appointment.new(user: @user, doctor: @doctor, description: 'abc',
                                    date_of_appointment: '2020-01-01', time_of_appointment: '12:00')
      expect(appointment).to_not be_valid
    end
  end
end
