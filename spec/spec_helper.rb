
ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require 'rspec'
require 'pg'
require 'survey'
require 'question'
require 'choice'


RSpec.configure do |config|
  config.after(:each) do
    Brand.all.each do |question|
      question.destroy()
    end
    Store.all().each() do |choice|
      choice.destroy()
    end
  end
end
