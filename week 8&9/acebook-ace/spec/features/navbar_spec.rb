require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature "Navbar", type: :feature do
  scenario "Navbar to not have content without login" do
    visit "/"
    @nav = find(".navbar")
    expect(@nav).to have_css(".acebook_logo")
    expect(@nav).to_not have_button("Logout")
    
  end
  scenario "Navbar displays logout when user is logged in" do
    sign_up
    log_in
    @nav = find(".navbar")
    expect(page).to have_content("Logged in Succesfully")
    expect(@nav).to have_button("Logout")
  end
  scenario "navbar displays image when logged in has provided image" do
    sign_up
    log_in
    expect(page).to have_css("img[src*='mark-zuck-img.jpg']")
end 
scenario "navbar displays default image when logged in hasn't provided image" do
  sign_up_no_pic
  log_in
  expect(page).to have_css("img[src*='/assets/profile pic-6d4b1d78590c7ef26b85ccfd246e5001972eed0e16f5a0d22a25e1ed260a68d9.png']")


end 
end 