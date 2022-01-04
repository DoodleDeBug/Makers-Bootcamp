def sign_up
  visit '/'
  click_link "Haven't got an account? Sign up!"
  fill_in 'user[email]', with: 'user@email.com'
  fill_in 'user[password]', with: 'password'
  fill_in 'user[password_confirmation]', with: 'password'
  attach_file(
    'user[image]',
    Rails.root + 'spec/features/test_assets/mark-zuck-img.jpg',
  )
  click_button 'Create User'
end

def log_in
  visit '/'
  fill_in 'email', with: 'user@email.com'
  fill_in 'password', with: 'password'
  click_button 'Login'
end

def sign_up_no_pic
  visit '/'
  click_link "Haven't got an account? Sign up!"
  fill_in 'user[email]', with: 'user@email.com'
  fill_in 'user[password]', with: 'password'
  fill_in 'user[password_confirmation]', with: 'password'
  click_button 'Create User'
end

def sign_up_alternate_user
  visit '/'
  click_link "Haven't got an account? Sign up!"
  fill_in 'user[email]', with: 'user1@email.com'
  fill_in 'user[password]', with: 'password1'
  fill_in 'user[password_confirmation]', with: 'password1'
  attach_file(
    'user[image]',
    Rails.root + 'spec/features/test_assets/mark-zuck-img.jpg',
  )
  click_button 'Create User'
end

def log_in_alternate_user
  visit '/'
  fill_in 'email', with: 'user1@email.com'
  fill_in 'password', with: 'password1'
  click_button 'Login'
end
