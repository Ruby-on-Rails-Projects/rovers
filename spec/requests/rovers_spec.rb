require 'rails_helper'

RSpec.describe "Rovers", type: :request do
  describe "should moving rover" do
    it 'should position final equal N and x and y not change' do
      params = {
        position: "1 2 N",
        control: "LLLL"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "1 2 N" }.to_json)
    end

    it 'should position final equal S and x and y not change' do
      params = {
        position: "1 2 N",
        control: "LLLR"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "1 2 S" }.to_json)
    end

    it 'should position final to W and move 1 to x' do
      params = {
        position: "1 2 N",
        control: "LM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "0 2 W" }.to_json)
    end

    it 'should position final to N and move y to 4' do
      params = {
        position: "0 0 N",
        control: "MMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "0 4 N" }.to_json)
    end

    it 'should position final to N and move y to 5 after five movements' do
      params = {
        position: "0 0 N",
        control: "MMMMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "0 0 N" }.to_json)
    end

    it 'should position final to E and move y to 3 after three movements' do
      params = {
        position: "0 0 N",
        control: "RMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "3 0 E" }.to_json)
    end

    it 'should position final to E and move y to 5 after five movements' do
      params = {
        position: "0 0 N",
        control: "RMMMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "5 0 E" }.to_json)
    end

    it 'should position final to E and move y to 0 after six movements' do
      params = {
        position: "0 0 N",
        control: "RMMMMMM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "0 0 E" }.to_json)
    end

    it 'xxx' do
      params = {
        position: "3 3 E",
        control: "MMRMMRMRRM"
      }

      post '/rover', :params => params
      expect(response.body).to eq({ "position": "5 1 E" }.to_json)
    end

  end
end
