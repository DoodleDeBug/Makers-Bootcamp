require 'rails_helper'
require_relative './web_helper.rb'

RSpec.feature 'Post Image', type: :feature do
  scenario 'There is a Create New Post button' do
    sign_up
    log_in
    expect(page).to have_content('Create New Post')
  end

  scenario 'can create a new image' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    # we do not know how to check for an image file
    # fill_in 'post_image[image]', with: 'thisisadummystingforimg'
    click_button 'Submit'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'There is a Create New Post link' do
    sign_up
    log_in
    expect(page).to have_content('Create New Post')
  end

  scenario 'can create a comment' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    expect(page).to have_content('this is the first comment')
  end

  scenario 'can edit post' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Edit'
    fill_in 'post_image[title]', with: 'Hello Cat2'
    fill_in 'post_image[content]', with: 'This is a photo of an cute cat'
    click_button 'Submit'
    expect(page).to have_content('Hello Cat2')
    expect(page).to have_content('This is a photo of an cute cat')
  end

  scenario 'can delete a comment' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    click_link 'Delete Comment'
    expect(page).not_to have_content('this is the first comment')
  end

  scenario 'shows the number of comments on a photo' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    click_link 'Back'
    expect(page).to have_content('2')
  end

  scenario 'defaults to zero comments' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    expect(page).to have_content('0')
  end

  scenario 'you can see when an Image was created' do
    time = Time.now.strftime('%A %d %B %Y, %I:%M%p')
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    expect(page).to have_content("#{time}")
  end

  scenario 'you can see when a comment was made' do
    time = Time.now.strftime('%A %d %B %Y, %I:%M%p')
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    expect(page).to have_content("#{time}")
  end

  scenario 'checks the order of images/posts are reverse chronological' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'This is the Second Post'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat again'
    click_button 'Submit'
    click_link 'Back'
    expect(page.all('h5.card-title').first).to have_content 'This is the Second Post'
  end

  scenario 'User can like post' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    first(:button, 'Like').click
    expect(page).to have_content('1')
  end

  scenario 'User can unlike post' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    first(:button, 'Like').click
    expect(page).to have_content('1')
    first(:button, 'Unlike').click
    expect(page).to have_content('0')
  end

  scenario 'new posts show user details(profile image and email)' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    expect(page).to have_content('user@email.com')
  end

  scenario 'you can see an alert on a successful post creation' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    expect(page).to have_content('Post was successfully created.')
  end

  scenario 'user must be logged in to access content' do
    log_in
    expect(page).to have_content('Login failed')
  end

  scenario 'user must be logged in to access content' do
    visit '/post_images'
    expect(page).to have_content('Must login to access content')
  end

  scenario 'post can be deleted by the user who created it' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_link 'Back'
    expect(page).to have_link('Delete')
  end

  scenario 'post cannot be deleted if the user has not created it' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    click_button 'Logout'
    sign_up_alternate_user
    log_in_alternate_user
    expect(page).to have_no_link('Delete')
  end

  scenario 'comment can be deleted by the user who created it' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    expect(page).to have_link('Delete Comment')
  end

  scenario 'comment cannot be deleted if the user has not created it' do
    sign_up
    log_in
    click_link 'Create New Post'
    fill_in 'post_image[title]', with: 'Hello Cat'
    fill_in 'post_image[content]', with: 'This is a photo of an evil cat'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'this is the first comment'
    click_button 'Create Comment'
    click_button 'Logout'
    sign_up_alternate_user
    log_in_alternate_user
    first(:link, 'Comment').click
    expect(page).to have_no_link('Delete Comment')
  end
end
