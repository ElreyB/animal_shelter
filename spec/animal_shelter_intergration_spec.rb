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

  it 'it goes to admin page' do
    visit('/')
    click_link('Potential Owner')
    expect(page.find('//h1')).to have_content("Welcome Potential Owner")
  end
end

describe('Admin welcome page', {:type => :feature}) do
  it 'goes to list of animals' do
    visit('/admin')
    click_link('Add Animal')
    expect(page.find('//h2')).to have_content("Here are you current animal residents:")
  end

  it 'goes to customer list' do
    visit('/admin')
    click_link('Add Customer')
    expect(page.find('//h2')).to have_content("Here are you current potential owners:")
  end

  it 'goes to chronological list of animals' do
    visit('/admin')
    click_link('Residents')
    expect(page.find('//h2')).to have_content("Longest Residents")
  end
end
