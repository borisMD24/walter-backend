require "rails_helper"

RSpec.describe ThemeLightsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/theme_lights").to route_to("theme_lights#index")
    end

    it "routes to #show" do
      expect(get: "/theme_lights/1").to route_to("theme_lights#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/theme_lights").to route_to("theme_lights#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/theme_lights/1").to route_to("theme_lights#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/theme_lights/1").to route_to("theme_lights#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/theme_lights/1").to route_to("theme_lights#destroy", id: "1")
    end
  end
end
