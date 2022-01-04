require 'rails_helper'

RSpec.describe MainController, type: :controller do
  describe "GET / " do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /log_in" do

    it "does not log user in if not-signed-up user" do
      post :create, params: { email: "test@abcvd.com", password:"test"} 

      expect(session[:user_id]).to be_nil
    end 

    it "log user in if signed-up user" do
      User.create({email: "test@test.com", password: "test", password_confirmation: "test"})

      user = User.find_by(email: "test@test.com")

      post :create, params: { email: "test@test.com", password:"test"} 

      expect(session[:user_id]).to be user.id
    end 
  end 

  describe "DELETE /logout" do
    it "logs user out" do
      User.create({email: "test@test.com", password: "test", password_confirmation: "test"})

      user = User.find_by(email: "test@test.com")

      post :create, params: { email: "test@test.com", password:"test"} 

      delete :destroy

      expect(session[:user_id]).to be nil
    end 
  end 

end
