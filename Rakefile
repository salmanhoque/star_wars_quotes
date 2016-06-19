require 'sinatra/activerecord/rake'

namespace :db do
  desc 'Load db migrations tasks'
  task :load_config do
    require './config/db'
  end
end

namespace :docker do
  desc 'create postgres database and volume'
  task :pg_create do
    sh 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d postgres'
    sh 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml stop'
  end

  desc 'migrate database schema'
  task :app_db_migration do
    sh 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml run app_server bundle exec rake db:migrate'
  end

  desc 'add seed data'
  task :app_db_seed do
    sh 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml run app_server bundle exec rake db:seed'
  end

  desc 'start app'
  task :app_start do
    sh 'docker-compose -f docker-compose.yml -f docker-compose.prod.yml up'
  end
end
