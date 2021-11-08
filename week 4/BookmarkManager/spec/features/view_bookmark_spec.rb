feature 'view bookmark' do
  scenario 'displays bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'Here are your bookmarks:'
    expect(page).to have_content 'http://www.bbc.co.uk'
    expect(page).to have_content 'http://www.sky.com'
    expect(page).to have_content 'https://www.channel4.com'
  end
end