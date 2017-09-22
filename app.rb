require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/animal'
require './lib/customer'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => 'animal_shelter'})


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
  erb(:animal_list)
end

get('/admin/customers') do
  @admin = true
  erb(:customer_list)
end

get('/admin/chronological_animals') do
  @admin = "longest residents"
  erb(:animal_list)
end
