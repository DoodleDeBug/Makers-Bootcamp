require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    result = conn.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url']}
  end
end

