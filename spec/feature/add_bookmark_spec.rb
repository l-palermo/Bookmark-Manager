RSpec.feature 'Add bookmark', type: :feature do
  scenario 'add a bookmark to the database table' do

    visit '/bookmarks/new'
    fill_in 'title', :with => 'you tube'
    fill_in 'url', :with => 'http://www.youtube.com'
    click_button 'submit'

    expect(page).to have_content("you tube")
    expect(page).not_to have_content('http://www.youtube.com')
  end
end
