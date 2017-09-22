require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/animal'
require './lib/customer'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'animal_shelter_test'})


get('/') do
  erb(:index)
end

get('/admin') do
  erb(:admin)
end

get('/guest') do
  erb(:potential_owner)
end


get('/admin/animals') do
  @admin = true
  @animals = Animal.all
  # binding.pry
  erb(:animal_list)
end

post('/admin/animal/add') do
  animal = Animal.new({
    name: params['name'],
    gender: params['gender'],
    admitted: params['admitted'],
    type: params['type'],
    breed: params['breed']
    })
  animal.save
  redirect '/admin/animals'
end

get('/admin/customers') do
  @admin = true
  erb(:customer_list)
end

get('/admin/chronological_animals') do
  @admin = "longest residents"
  erb(:animal_list)
end
