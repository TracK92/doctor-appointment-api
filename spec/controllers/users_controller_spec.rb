require 'rails_helper'

RSpec.describe 'Users', type: %w[request feature] do
  before do
    post '/api/v1/users',
            params: { user: { name: 'Alex'} }
    @user = User.last
  end

  it 'creates a user' do
    expect(@user.name).to eq('Alex')
  end
end