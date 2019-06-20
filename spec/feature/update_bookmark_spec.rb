RSpec.feature 'update bookmark' do

  scenario 'update bookmark' do

    bookmark = Bookmark.create('http://www.gumtree.co.uk', 'gumtree')
    visit '/bookmarks'
    expect(page).to have_link('gumtree', href: 'http://www.gumtree.co.uk')

    first('.bookmark').click_button 'edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in 'url', :with => 'http://www.yahoo.com'
    fill_in 'title', :with => 'new yahoo'
    click_button 'submit'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('gumtree', href: 'http://www.gumtree.co.uk')
    expect(page).to have_link('new yahoo'), href: 'http://www.yahoo.com'
  end
end