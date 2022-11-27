require 'rails_helper'

RSpec.describe 'Doctors', type: %w[request feature] do
  before do
    post '/api/v1/users',
         params: { user: { name: 'Alex' } }
    @user = User.all.last

    post '/api/v1/users/login',
         params: { user: { name: 'Alex' } }
    @name = JSON.parse(response.body)['name']

    get '/appointments',
         params: { appointments: { name: 'Dr. Alex', specialization: 'Oncologist', photo: 'http://localhost/pic.png' } },
         headers: { Authorization: @symbolize_names }
    @appointments = Appointments.all.last
    JSON.parse(response.body)
  end

     it 'should create an appointment' do
           expect(@appointments.name).to eq('Dr. Alex')
      end
end