require 'rails_helper'

RSpec.describe RegistrationsController do

  describe "POST test registration", :type => :request do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:users]
      user = FactoryBot.create(:user)
      post 'http://localhost:3000/signup', 
        :params => {
          :email => user.email,
          :password => user.password
        }
    end    
    
    it "returns http success" do
      expect(response).to have_http_status(:created)
    end    
    
    it "JSON body response contains expected recipe attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "email", "role", "latitude", "longitude", "zip_code", "adress", "country", "shop_id", "created_at", "updated_at"])
    end
  end

end