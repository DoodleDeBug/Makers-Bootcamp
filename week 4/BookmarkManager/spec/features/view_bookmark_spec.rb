require 'pg'

feature 'view bookmark' do
  scenario 'displays bookmarks' do

    conn = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.facebook.com/');")


    visit '/bookmarks'

    expect(page).to have_content 'Here are your bookmarks:'

    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.facebook.com/"
  end
end