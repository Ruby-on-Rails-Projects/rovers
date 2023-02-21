require 'rails_helper'

RSpec.describe "Rovers", type: :request do
  describe "should moving rover" do
    it 'should return 1 3 N' do
      params = {
        "grid": "5 5",
        "rovers": [
          {
            "position": "1 2 N",
            "control": "LMLMLMLMM"
          }
        ]
      }

      post '/rover', :params => params
      expect(response.body).to eq([{
                                     "position_x": 1,
                                     "position_y": 3,
                                     "direction": "N"
                                   }].to_json)
    end

    it 'should return 5 1 E' do
      params = {
        "grid": "5 5",
        "rovers": [
          {
            "position": "3 3 E",
            "control": "MMRMMRMRRM"
          }
        ]
      }

      post '/rover', :params => params
      expect(response.body).to eq([{
                                     "position_x": 5,
                                     "position_y": 1,
                                     "direction": "E"
                                   }].to_json)
    end

    it 'should test return 1 0 W' do
      params = {
        "grid": "5 5",
        "rovers": [
          {
            "position": "0 0 N",
            "control": "LMMMM"
          }
        ]
      }

      post '/rover', :params => params
      expect(response.body).to eq([{
                                     "position_x": 1,
                                     "position_y": 0,
                                     "direction": "W"
                                   }].to_json)
    end
  end
end
