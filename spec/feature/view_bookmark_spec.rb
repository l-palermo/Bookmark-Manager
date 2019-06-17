require './app.rb'

RSpec.feature 'Test index page', :type => :feature do

  scenario 'shows Hello World' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

end
