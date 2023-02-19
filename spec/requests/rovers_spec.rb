require 'rails_helper'

RSpec.describe "Rovers", type: :request do
  describe "should moving rover" do
    it 'should return 1 3 N' do
      params = {
        position: "1 2 N",
        control: "LMLMLMLMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "1 3 N" }.to_json)
    end

    it 'should return 5 1 E' do
      params = {
        position: "3 3 E",
        control: "MMRMMRMRRM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "5 1 E" }.to_json)
    end

    it 'should test return 1 0 W' do
      params = {
        position: "0 0 N",
        control: "LMMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "1 0 W" }.to_json)
    end
  end
end
