require 'swagger_helper'

RSpec.describe 'rovers', type: :request do
  describe "Calling Rover Api" do
    path '/rover' do
      post 'move on with Rovers' do
        tags 'Rovers'
        consumes 'application/json', 'application/xml'
        parameter name: :rover, in: :body, schema: {
          type: :object,
          properties: {
            grid: { type: :string },
            rovers: { type: :array }
          },
          required: %w[position control]
        }

        response '200', 'rover moved successfully' do
          let(:rover) { {
            "grid": "5 5",
            "rovers": [
              {
                "position": "1 2 N",
                "control": "LMLMLMLMM"
              },
              {
                "position": "3 3 E",
                "control": "MMRMMRMRRM"
              }
            ]
          } }
          run_test!
        end

        response '422', 'invalid request' do
          let(:rover) { {
            "rovers": [
              {
                "position": "1 2 N",
                "control": "LMLMLMLMM"
              }
            ]
          } }
          run_test!
        end
      end
    end
  end
end
