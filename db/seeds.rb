require './config/db'
require './models/search'
require './models/quote'
require 'faker'

250.times do
  Quote.create(quote: Faker::StarWars.quote)
end
