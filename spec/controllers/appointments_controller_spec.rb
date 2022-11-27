require 'rails_helper'

RSpec.describe 'Appointments', type: %w[request feature] do
  before do
    post '/api/v1/users',
          params: { user: { name: 'Alex' } }
    @user = User.all.last

    post '/api/v1/users/login',
          params: { user: { name: 'Alex' } }
    @token = JSON.parse(response.body)['token']

    post '/api/v1/users/appointments/doctors',
          params: { doctor: { name: 'Dr. Alex', specialization: 'Oncologist', photo: 'http://localhost/pic.png' } },
          headers: { Authorization: @token }
    @doctor = Doctor.all.last

    post '/api/v1/users/:id/appointments/',
          params: { appointments: {description: 'chest pain', date_of_appointment: '23.12.2022', time_of_appointment: '12:00' } },
          headers: { Authorization: @token }
    @appointment = User.find(@user.id).appointments.last
  end

  it 'should render a appointments list' do
    get '/api/v1/appointments'
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body).length).to eq(0)
  end

  it 'should show a appointment' do
    get '/api/v1/appointments'
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq([])
  end
end
