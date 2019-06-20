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

  describe '#delete' do
    it 'delete an existing bookmark' do
      bookmark = Bookmark.create('http://www.youtube.com', 'You tube')
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all).not_to include(bookmark)
    end
  end

  describe '#update' do
    it 'update the existing bookmark' do
      bookmark = Bookmark.create('http://www.gumtree.co.uk', 'gumtree')
      # this test is not valid because everytime I craete a call .all it create new instances of bookmark
      # expect(Bookmark.all).to include(bookmark)

      updated_bookmark = Bookmark.update(bookmark.id, 'http://www.yahoo.com', 'new yahoo')
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq('new yahoo')
      expect(updated_bookmark.url).to eq('http://www.yahoo.com')
    end
  end

  describe '#find' do
    it 'find the current bookmark' do
      bookmark = Bookmark.create('http://www.gumtree.co.uk', 'gumtree')
      result = Bookmark.find(bookmark.id)
      
      expect(result.title).to eq('gumtree')
      expect(result.url).to eq('http://www.gumtree.co.uk')
    end
  end
end
