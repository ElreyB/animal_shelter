require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Home Page', {:type => :feature}) do
  it 'Show welcome sign' do
    visit('/')
    expect(page.find('//h1')).to have_content("Welcome to Elrey's Cuddle Ainmal Shelter")
  end
end

describe('Welcome page', {:type => :feature}) do
  it 'it goes to admin page' do
    visit('/')
    click_link('Shelter Worker')
    expect(page.find('//h1')).to have_content("Welcome Shelter Worker")
  end
end
