require 'sinatra/activerecord/rake'
Dir.glob('./tasks/*.rake').each { |rakefile| load rakefile }

namespace :db do
  desc 'Load db migrations tasks'
  task :load_config do
    require './config/db'
  end
end
