def enter_info_and_submit_form
  visit('/')
  fill_in 'name', with: 'Bob'
  fill_in 'day', with: '1'
  fill_in 'month', with: 'January'
  click_button 'Go'
end