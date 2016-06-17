require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

set :database, adapter: 'postgresql',
               database: 'starwars_quotes',
               username: 'sal',
               pool: 5
