require './lib/bookmark'
require 'pg'

describe Bookmark do

  describe '.all' do
    it 'returns a list of bookmarks' do
      conn = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.facebook.com/');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include 'http://www.makersacademy.com'
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.twitter.com"
      expect(bookmarks).to include "http://www.facebook.com/"

    end
end

end
