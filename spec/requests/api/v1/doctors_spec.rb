require 'swagger_helper'

RSpec.describe 'api/v1/doctors', type: :request do
  path '/api/v1/{user_id}/doctors' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    post('create doctor') do
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })

      response(200, 'successful') do
        consumes 'application/json'

        security [Authorization: []]
        let(:Authorization) { "Authorization #{generate_token}" }

        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            specialization: { type: :string },
            photo: { type: :string }
          },
          required: %w[name specialization photo]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end
    end
  end

  path '/api/v1/users/{user_id}/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete doctor') do

      parameter({
      in: :header,
      type: :string,
      name: :Authorization,
      required: true,
      description: 'Client token'
    })

      response(200, 'successful') do
        security [Authorization: []]
        let(:Authorization) { "Authorization #{generate_token}" }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}/doctors' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show_user_doctors doctor') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors' do
    get('list doctors') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/doctors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show doctor') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update doctor') do
      parameter({
      in: :header,
      type: :string,
      name: :Authorization,
      required: true,
      description: 'Client token'
    })

      response(200, 'successful') do
        security [Authorization: []]
        let(:Authorization) { "Authorization #{generate_token}" }
        let(:id) { '123' }

        parameter name: :doctor, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            specialization: { type: :string },
            photo: { type: :string }
          },
          required: %w[name specialization photo]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
