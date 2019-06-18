require 'pg'

class Bookmark

  def self.all
    connect = PG.connect( dbname: 'bookmark_manager' )
    connect.exec( "SELECT * FROM bookmarks" ) do |result|
    result.map do |row| row['url'] end end
  end


end