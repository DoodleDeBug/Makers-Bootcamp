require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature 'Room', type: :feature do

  scenario 'The user can add a new room' do
    sign_up
    log_in
    click_link 'Chat'
    expect(page).to have_content('Add a new room')
  end

  scenario 'The user can create a new room' do
    sign_up
    log_in
    click_link 'Chat'
    fill_in 'room[name]', with: 'Room 1'
    click_button 'Add'
    expect(page).to have_content('Room was successfully created')
  end

  scenario 'The user can return to the posts page from a room' do
    sign_up
    log_in
    click_link 'Chat'
    fill_in 'room[name]', with: 'Room 1'
    click_button 'Add'
    click_link 'Back to Posts'
    expect(page).to have_content('Posts')
  end

  # scenario 'The user can add a message in a room' do
  #   sign_up
  #   log_in
  #   click_link 'Chat'
  #   fill_in 'room[name]', with: 'Room 1'
  #   click_button 'Add'
  #   fill_in 'message[content]', with: 'This is a message'
  #   click_button 'Add Message'
  #   expect(page).to have_content('This is a message')
  # end

end