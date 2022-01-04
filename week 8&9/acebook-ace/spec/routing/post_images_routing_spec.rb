require "rails_helper"

RSpec.describe PostImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/post_images").to route_to("post_images#index")
    end

    it "routes to #new" do
      expect(get: "/post_images/new").to route_to("post_images#new")
    end

    it "routes to #show" do
      expect(get: "/post_images/1").to route_to("post_images#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/post_images/1/edit").to route_to("post_images#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/post_images").to route_to("post_images#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/post_images/1").to route_to("post_images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/post_images/1").to route_to("post_images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/post_images/1").to route_to("post_images#destroy", id: "1")
    end
  end
end
