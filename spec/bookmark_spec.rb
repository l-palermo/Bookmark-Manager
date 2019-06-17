require './lib/bookmark.rb'

RSpec.describe Bookmark do
  let(:bookmark) { double Bookmark.new }

  it 'returns a list of bookmarks' do
    expect(Bookmark.all).to eq(["http://www.google.com", "http://www.destroyallsoftware.com", "http://www.makersacademy.com"])
  end
end