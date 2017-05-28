require 'sinatra'

set :env, :production

require './app.rb'

run Sinatra::Application
