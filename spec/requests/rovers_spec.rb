require 'rails_helper'

RSpec.describe "Rovers", type: :request do
  describe "should moving rover" do
    it 'should position final equal N' do
      params = {
        position: "1 2 N",
        control: "LLLL"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "N" }.to_json)
    end

    it 'should position final equal S' do
      params = {
        position: "1 2 N",
        control: "LLLR"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "S" }.to_json)
    end

  end
end
