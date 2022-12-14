require 'rails_helper'

RSpec.describe 'Users', type: %w[request feature] do
  before do
    post '/api/v1/users',
         params: { user: { name: 'Alex' } }
    @user = User.last
  end

  it 'creates a user' do
    expect(@user.name).to eq('Alex')
  end

  it 'logs in a user' do
    post '/api/v1/users/login',
         params: { user: { name: 'Alex' } }
    expect(response).to have_http_status(202)
    expect(JSON.parse(response.body)['name']).to_not be_nil
  end

  it 'should render a users doctors' do
    get '/api/v1/users/1/doctors'
    expect(response).to have_http_status(200)
  end

  it 'should render a users appointments' do
    get '/api/v1/users/1/appointments'
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)).to eq([])
  end
end
