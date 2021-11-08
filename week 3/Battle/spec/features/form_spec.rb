feature 'form' do
  scenario 'completion of form leads to new page that displays name' do
    sign_in_and_play
    expect(page).to have_content 'Bob vs Rob'
  end
end