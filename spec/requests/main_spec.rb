require 'rails_helper'

RSpec.describe "Mains", type: :request do
  describe "GET /index" do
    it 'should redirect to api-docs successfully' do
      get '/'
      expect(response.status).to eq(302)
    end
  end
end
