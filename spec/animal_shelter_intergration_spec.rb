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

describe('Admin animal list page', {:type => :feature}) do
  context 'when there are animals on list' do
    it 'will show animals on list' do
      visit('/animal_list')
      click_button('Add Animal')
      fill_in('name', :with => "Osrey")
      fill_in('gender', :with => "male")
      fill_in('admitted', :with => "2017-09-11")
      fill_in('type', :with => "cat")
      fill_in('breed', :with => "maincoon")
      click_button('Add')
      expect(page).to have_content("Osrey")
    end
  end

  context 'when there are no animals on list' do
    it 'will show no animals message' do
      visit('/animal_list')
      expect(page).to have_content("Current no animals in our database.")
    end
  end
end
