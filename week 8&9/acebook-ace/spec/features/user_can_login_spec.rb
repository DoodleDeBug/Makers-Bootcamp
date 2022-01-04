require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature 'Login', type: :feature do
  scenario 'User can login' do
    sign_up
    log_in
    expect(page).to have_content('Logged in Succesfully')
    expect(page).to have_content('user@email.com')
    expect(page).to have_button('Logout')
  end

  scenario "User can't login with incorrect details" do
    sign_up
    fill_in 'email', with: 'user@email.co'
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content('Login failed')
  end

  scenario "User can't access dashboard without login" do
    visit '/post_images'
    expect(page).to have_content('Must login to access content')
  end

  scenario "User can't access login page whilst logged in" do
    sign_up
    log_in
    visit '/'
    expect(page).to have_content('Cannot access this page whilst logged in')
  end

  scenario "User can't access sign up page whilst logged in" do
    sign_up
    log_in
    visit '/sign_up'
    expect(page).to have_content('Cannot access this page whilst logged in')
  end
end
