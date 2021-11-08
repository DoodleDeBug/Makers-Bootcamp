feature 'homepage' do
  scenario 'has a title' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end