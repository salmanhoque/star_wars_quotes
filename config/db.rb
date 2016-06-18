require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

# developement db: starwars_quotes
set :database, adapter: 'postgresql',
               database: ENV['DB_NAME'],
               username: 'sal',
               pool: 5
