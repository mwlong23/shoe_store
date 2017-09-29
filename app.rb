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
  @brands = Brand.all
  erb(:brands)
end
get('/stores') do
  @stores = Store.all
  erb(:stores)
end
get('/stores/:id') do
    @store = Store.find(params[:id].to_i)
  # binding.pry
  erb(:store)
end

get('/new_brand') do
  erb(:new_brand)
end

post('/new_brand') do
  brand_name = params['new_brand_name']
  price = params['price']
  @brand = Brand.create({name: brand_name, price: price})
  erb(:success)
end

get('/new_store') do
  erb(:new_store)
end

post('/new_store') do
  store_name = params['new_store_name']
  @store = Store.create({name: store_name})
  erb(:success)
end

get('/store_edit/:id') do
  @store = Store.find(params[:id])
  erb(:store_edit)
end

patch('/store_edit/:id') do
  @store_id = params['store_id'].to_i
  @store = Store.find(@store_id)
  new_name = params['new_name']
  @store.update({name: new_name})
  redirect("/stores/#{@store.id}")
end

delete('/store_edit/:id') do


  redirect('/stores')
end
