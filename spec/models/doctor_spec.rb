require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:each) do
    @user = User.create(name: 'Jane')
    @doctor = Doctor.create(user: @user, name: 'Dr. John Doe', specialization: 'Pediatrics', photo: 'https://example.com/photo.jpg')
  end

  describe 'associations' do
    it 'should have many appointments' do
      assc = described_class.reflect_on_association(:appointments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'validations' do
    it 'is not valid without a name' do
      doctor = Doctor.new(name: nil)
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      doctor = Doctor.new(name: 'ab')
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a name more than 50 characters' do
      doctor = Doctor.new(name: 'a' * 51)
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a specialization' do
      doctor = Doctor.new(specialization: nil)
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a specialization less than 3 characters' do
      doctor = Doctor.new(specialization: 'ab')
      expect(doctor).to_not be_valid
    end

    it 'is not valid with a specialization more than 50 characters' do
      doctor = Doctor.new(specialization: 'a' * 51)
      expect(doctor).to_not be_valid
    end

    it 'is not valid without a photo' do
      doctor = Doctor.new(photo: nil)
      expect(doctor).to_not be_valid
    end

    it 'is valid with a name between 3 and 50 characters' do
      expect(@doctor).to be_valid
    end

    it 'is valid with a name between 3 and 50 characters' do
      @doctor.name = 'a' * 50
      expect(@doctor).to be_valid
    end

    it 'is valid with a specialization between 3 and 50 characters' do
      expect(@doctor).to be_valid
    end

    it 'is valid with a specialization between 3 and 50 characters' do
      @doctor.specialization = 'a' * 50
      expect(@doctor).to be_valid
    end

    it 'is valid with a photo' do
      expect(@doctor).to be_valid
    end
  end
end
