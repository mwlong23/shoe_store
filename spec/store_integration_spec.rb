require 'spec_helper'
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it('allows a user to enter a new brand to the database') do
    visit('/new_store')
    fill_in('new_store_name', :with =>'walmart')
    click_button('Submit')
    expect(page).to have_content('Walmart')
  end
end

describe('viewing store details after adding', {:type => :feature}) do
  it('allows a user to view a store\'s details afte it has been entered') do
    visit('/new_store')
    fill_in('new_store_name', :with =>'home depot')
    click_button('Submit')
    expect(page).to have_content('Brands Home Depot carries')
  end
end

describe('creating a store and adding a brand', {:type => :feature}) do
  it('allows a user to view a brand that has been added to a store') do
    visit('/new_store')
    fill_in('new_store_name', :with =>'home depot')
    click_button('Submit')
    click_on('Add A New Brand')
    expect(page).to have_content('Add a new brand:')
  end
end
