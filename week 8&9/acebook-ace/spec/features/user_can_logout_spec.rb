require 'rails_helper'

RSpec.feature "Logout", type: :feature do
  scenario "User can logout" do
    sign_up
    log_in
    click_button "Logout"
    expect(page).to have_content("Logged out")
   end
end