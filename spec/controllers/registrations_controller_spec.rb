require 'rails_helper'

RSpec.describe RegistrationsController do

  describe "POST test registration", :type => :request do
    before do
      @controller.class.skip_before_action :sign_up_params_verifications, raise: false
      @request.env["devise.mapping"] = Devise.mappings[:users]
      user = FactoryBot.create(:user)
      post 'http://localhost:3000/signup', 
        :params => {
          :email => user.email,
          :password => user.password
        }
    end    
    
    it "returns http created" do
      expect(response).to have_http_status(:created)
    end    
    
    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "email", "role", "latitude", "longitude", "zip_code", "adress", "country", "shop_id", "created_at", "updated_at"])
    end
  end

  describe "PUT update registration", :type => :request do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:users]
      user = FactoryBot.create(:user)
      sign_in user
      request.headers.merge!(user.create_new_auth_token)
      put 'http://localhost:3000/signup',
        :params => {
          :email => user.email,
          :current_password => user.password,
          :password => "coucou123",
          :password_confirmation => "coucou123"
        }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected attributes" do
      json_response = JSON.parse(response.body)
      expect(json_response.keys).to match_array(["id", "email", "role", "latitude", "longitude", "zip_code", "adress", "country", "shop_id", "created_at", "updated_at"])
    end

  end

end