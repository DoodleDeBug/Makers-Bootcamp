feature 'hit points' do
  scenario 'display hit points' do
    sign_in_and_play
    expect(page).to have_content 'Bob hp: 60/60, Rob hp: 60/60'
  end
end