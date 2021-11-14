require 'pg'

def setup_test_database
  p 'setting up database....'
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE bookmarks;')
end