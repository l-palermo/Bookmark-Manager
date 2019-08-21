RSpec.feature 'comments' do

  scenario 'add comment to bookmark' do
    bookmark = Bookmark.create('http://www.youtube.com', 'you tube')

    visit '/bookmarks'
    first('.bookmark').click_button 'add_comment'
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/comments/new")

    fill_in 'comment', :with => 'some comments'
    click_button 'submit'

    expect(current_path).to eq('/bookmarks')
    expect(first('.bookmark')).to have_content('some comments')
  end
end 