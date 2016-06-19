require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

case ENV['APP_ENV']
when 'development'
  set :database, adapter: 'postgresql',
                 host:     'postgres',
                 database: 'starwars_quotes',
                 username: 'postgres',
                 password: 'password',
                 pool: 5
when 'test'
  set :database, adapter: 'postgresql',
                 host:     'postgres',
                 database: 'starwars_quotes_test',
                 username: 'postgres',
                 password: 'password',
                 pool: 5
end
