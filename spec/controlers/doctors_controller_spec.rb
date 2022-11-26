require 'rails_helper'

RSpec.describe 'Doctors', type: %w[request feature] do
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
    JSON.parse(response.body)
  end

  it 'should render a doctors list' do
    get '/api/v1/doctors'
    expect(response).to have_http_status(200)
  end
end
