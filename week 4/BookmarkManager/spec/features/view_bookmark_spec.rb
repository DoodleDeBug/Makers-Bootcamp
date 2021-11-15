feature 'view bookmark' do
  scenario 'displays bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Here are your bookmarks:'
    expect(page).to have_content "http://makersacademy.tech"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end