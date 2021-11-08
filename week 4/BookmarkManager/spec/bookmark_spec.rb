require './lib/bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include 'http://www.bbc.co.uk'
    expect(bookmarks).to include 'http://www.sky.com'
    expect(bookmarks).to include 'https://www.channel4.com'
  end
end
