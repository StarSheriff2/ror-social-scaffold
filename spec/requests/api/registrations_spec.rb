require 'swagger_helper'

RSpec.describe 'api/registrations', type: :request do

  path '/api/users' do

    post('create registration') do
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
end
