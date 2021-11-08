def sign_in_and_play
  visit('/')
  fill_in 'player_1', with: 'Bob'
  fill_in 'player_2', with: 'Rob'
  click_button 'Submit'
end
