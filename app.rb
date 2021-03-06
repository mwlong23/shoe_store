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
    @brands = @store.brands
  erb(:store)
end

get('/new_brand') do
  erb(:new_brand)
end

get('/brands/:id') do
  @brand = Brand.find(params[:id])
  @stores = @brand.stores
  # ^ THIS RETURNS AN EMPTY ARRAY

  erb(:brand)
end

post('/new_brand') do
  brand_name = params['new_brand_name']
  price = params['price']
  @brand = Brand.new({name: brand_name, price: price})
  @brand.store_ids = nil
  if @brand.save()
    redirect("/brands")
  else
    erb(:brand_errors)
  end
end

get('/new_store') do
  erb(:new_store)
end

post('/new_store') do

  store_name = params['new_store_name']
  @store = Store.new({name: store_name})
  @store.brand_ids = nil
  if @store.save()
    redirect "/stores/#{@store.id}"
  else
    erb(:store_errors)
  end
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
  this_store = Store.find(params['id'])
  Store.destroy(params[:id].to_i)
  redirect('/stores')
end

get('/brand_edit/:id') do
  @brand = Brand.find(params[:id])
  erb(:brand_edit)
end

patch('/brand_edit/:id') do
  @brand_id = params['brand_id'].to_i
  @brand = Brand.find(@brand_id)
  new_name = params['new_name']
  new_price = params['new_price']
  @brand.update({name: new_name, price: new_price})
  redirect("/brands/#{@brand.id}")
end

delete('/brand_edit/:id') do
  this_brand = Brand.find(params['id'])
  Brand.destroy(params[:id].to_i)
  redirect('/brands')
end

get('/brand_add_store/:id') do
  @stores = Store.all
  @brand = Brand.find(params["id"])
  erb(:brand_add_store)
end

get('/store_add_brand/:id') do
  @brands = Brand.all
  @store = Store.find(params['id'])
  erb(:store_add_brand)
end

patch('/add_stores_success/:id') do
  @brand_id = params[:id].to_i
  @brand = Brand.find(@brand_id)
  @stores_ids = params['store_ids']
  @stores = Store.find(params['store_ids'])
  @brand.update({store_ids: @stores_ids})
  redirect "/brands/#{@brand_id}"
end

patch('/add_brands_success/:id') do
  @store_id = params[:id].to_i
  @store = Store.find(@store_id)
  @brands_ids = params['brand_ids']
  @brands= Brand.find(params['brand_ids'])
  @store.update({brand_ids: @brands_ids})
  redirect "/stores/#{@store_id}"
end



# https://learn.co/lessons/sinatra-complex-forms-associations
