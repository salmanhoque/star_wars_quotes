require 'sinatra'
require 'haml'
require './config/db'
require './models/search'
require './models/quote'
require 'pry'

set :public_folder, 'public'
after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @quotes = Quote.all
  haml :index
end

get '/s' do
  quotes_ids = Search.search(params[:keys]).pluck(:quote_id)
  @quotes = Quote.where(id: quotes_ids)
  haml :index
end
