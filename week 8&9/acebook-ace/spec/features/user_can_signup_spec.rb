require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature "Sign up", type: :feature do
  scenario "User can sign up" do
    sign_up
    expect(page).to have_content("Haven't got an account? Sign up!")
  end

scenario "can visit sign up page" do
   visit "/"
   click_link "Haven't got an account? Sign up!"
   expect(page).to have_content("Sign Up")
end
end 

