require 'sinatra'
require 'haml'
require './config/db'
require './models/search'
require './models/quote'

set :public_folder, 'public'
after do
  ActiveRecord::Base.connection.close
end

set :bind, '0.0.0.0'

get '/' do
  @quotes = Quote.all
  haml :index
end

get '/s' do
  quotes_ids = Search.search(params[:keys]).pluck(:quote_id)
  @quotes = Quote.where(id: quotes_ids)
  haml :index
end

get '/quotes/new' do
  haml :new
end

post '/quotes' do
  record = Quote.create(quote: params[:quote])
  first_word = record.quote.split(' ').first
  redirect to("/s?keys=#{first_word}")
end
