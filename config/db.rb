require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

case ENV['APP_ENV']
when 'developement'
  set :database, adapter: 'postgresql',
                 database: 'starwars_quotes',
                 username: 'sal',
                 pool: 5
when 'test'
  set :database, adapter: 'postgresql',
                 database: 'starwars_quotes_test',
                 username: 'sal',
                 pool: 5
end
