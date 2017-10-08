require 'spec_helper'
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new brand', {:type => :feature}) do
  it('allows a user to enter a new brand to the database') do
    visit('/new_brand')
    fill_in('new_brand_name', :with =>'adidas')
    fill_in('price', :with =>'200')
    click_button('Submit')
    expect(page).to have_content('Adidas')
  end
end
describe('viewing shoe brands', {:type => :feature}) do
  it('allows a user to see all brands entered into the database') do
    visit('/')
    click_on('See Brands')
    expect(page).to have_content('Welcome! A list of all brands of shoes listed below:')
  end
end

describe('viewing shoe brands', {:type => :feature}) do
  it('allows a user to see all brands entered into the database') do
    visit('/')
    click_on('Add a New Brand')
    expect(page).to have_content('Add a new brand:')
  end
end

describe('viewing a shoe brand\'s details', {:type => :feature}) do
  it('allows a user to see the stores that carry that brand') do
    visit('/new_brand')
    fill_in('new_brand_name', :with =>'puma')
    fill_in('price', :with =>'200')
    click_button('Submit')
    click_on('Puma')
    expect(page).to have_content('Puma can be found at these retailers:')
  end
end
