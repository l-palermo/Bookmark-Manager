# require './lib/bookmark.rb'
require 'database_helpers'

RSpec.describe Bookmark do

  it 'returns a list of bookmarks' do

    bookmark = Bookmark.create('http://www.makersacademy.com', 'makers')
    persisted_data = persisted_data(bookmark.id)
  
    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'makers'
    expect(bookmark.url).to eq 'http://www.makersacademy.com'
  end

  it 'add a new bookmark' do
    bookmark = Bookmark.create('http://www.youtube.com', 'You tube')

    expect(bookmark.url).to eq 'http://www.youtube.com'
    expect(bookmark.title).to eq 'You tube'
  end
end
