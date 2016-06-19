require 'dotenv'
require 'sinatra'
require 'sinatra/activerecord'
require 'pg'

Dotenv.load

case ENV['APP_ENV']
when 'development'
  set :database,
      adapter: 'postgresql',
      host:     ENV['POSTGRES_HOST'],
      database: 'starwars_quotes',
      username: ENV['POSTGRES_USER'],
      password: ENV['POSTGRES_PASSWORD'],
      pool: 5
when 'test'
  set :database,
      adapter: 'postgresql',
      host:     'postgres',
      database: 'starwars_quotes_test',
      username: 'postgres',
      password: 'password',
      pool: 5
end
