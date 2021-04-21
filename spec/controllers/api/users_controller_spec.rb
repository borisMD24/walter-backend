require 'rails_helper'

RSpec.describe Api::UsersController do
    describe "get user by id" do
        before do
            user = FactoryBot.create(:user)
            sign_in user
            get 'http://localhost:3000/api/users/1'
        end
    end

    it "returns http success" do
        expect(response).to have_http_status(:success)
    end

    it "JSON body response contains expected attributes" do
        json_response = JSON.parse(response)
        puts 20*"."
        puts json_response
        puts 20*"."
        expect(json_response.data.attributes.email).to match_array(user.email)
    end
end