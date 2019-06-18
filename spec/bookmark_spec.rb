# require './lib/bookmark.rb'

RSpec.describe Bookmark do
  let(:bookmark) { double Bookmark.new }

  it 'returns a list of bookmarks' do

    expect(Bookmark.all).to include("http://www.google.com")
    expect(Bookmark.all).to include("http://www.destroyallsoftware.com")
    expect(Bookmark.all).to include("http://www.makersacademy.com")
  end
end