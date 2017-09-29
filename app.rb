require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/brand")
require("./lib/store")
require("pg")
require("pry")

get('/') do
  erb(:index)
end

get('/brands') do
  erb(:brands)
end

get('/new_brand') do
  erb(:new_brand)
end

post('/new_brand') do
  brand_name = params['new_store_name']
  price = params['price']
  @brand = Brand.new({name: brand_name, price: price})
  binding.pry
  erb(:success)
end
