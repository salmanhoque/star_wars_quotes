require './config/db'
require './models/search'
require './models/quote'
require 'faker'

100.times do
  Quote.create(quote: Faker::StarWars.quote)
end
