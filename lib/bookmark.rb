require 'pg'

class Bookmark

  def self.create(url, title)
    return false unless !url.nil?
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    result = connect.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    result = connect.exec( "SELECT * FROM bookmarks" )
    result.map do |row| Bookmark.new(row['id'], row['title'], row['url']) end
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    connect.exec("DELETE FROM bookmarks WHERE id='#{id}';")
  end

  def self.update(id, url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    result = connect.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
    Bookmark.new( result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      connect = PG.connect(dbname: 'bookmark_manager_test')
    else
      connect = PG.connect(dbname: 'bookmark_manager')
    end
    result = connect.exec("SELECT * FROM bookmarks WHERE id='#{id}'")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end
