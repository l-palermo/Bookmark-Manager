RSpec.feature 'Deleting a bookmark' do

  scenario 'A user can delete a bookmark' do

    Bookmark.create('http://www.gumtree.co.uk', 'gumtree')
    visit '/bookmarks'
    expect(page).to have_link('gumtree', href: 'http://www.gumtree.co.uk')

    first('.bookmark').click_button 'delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('gumtree', href: 'http://www.gumtree.co.uk')
  end
end

