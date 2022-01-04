require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User visits homepage" do
    visit "/"
    expect(page).to have_content("Acebook")
    expect(page).to have_content("Login")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Login")
    expect(page).to have_link("Haven't got an account? Sign up!")
  end
end 
