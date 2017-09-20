require 'rspec'
require 'pry'
require 'pg'
require 'customer'
# require 'animal'

DB = PG.connect({:dbname => 'cuddle_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM customers *;")
    DB.exec("DELETE FROM animals *;")
  end
end
