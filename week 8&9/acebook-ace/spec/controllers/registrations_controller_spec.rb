require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "GET /sign_up " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe "POST /sign_up" do
    it "responds with 200" do
      post :create, params: { user: { email: "test@email.com", password:"password", password_confirmation: "password"} }
      expect(response).to redirect_to(root_url)
    end


    it "creates a user" do
        post :create, params: { user: { email: "test@email.com", password:"password", password_confirmation: "password"} }
      expect(User.find_by(email: "test@email.com")).to be
    end
  end


end