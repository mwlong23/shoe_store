
ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'brand'
require 'store'



RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each do |brand|
      brand.destroy()
    end
    Store.all().each() do |store|
      store.destroy()
    end
  end
end
