
RSpec.feature 'Testing bookmark', :type => :feature do
  
  scenario 'shows home page' do
    visit '/'
    expect(page).to have_content 'Bookmarks'
  end

  scenario 'viewing bookmarks' do

    Bookmark.create('http://www.makersacademy.com', 'makers')
    Bookmark.create('http://www.google.com', 'google')
    Bookmark.create('http://www.destroyallsoftware.com', 'destroy')

    visit '/bookmarks'
    expect(page).to have_link "makers", href: 'http://www.makersacademy.com'
    expect(page).to have_link "google", href: 'http://www.google.com'
    expect(page).to have_link "destroy", href: 'http://www.destroyallsoftware.com'
  end
end
