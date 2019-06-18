require 'pg'

class Bookmark

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    connect.exec( "SELECT * FROM bookmarks" ) do |result|
    result.map do |row| row['url'] end end
  end


end