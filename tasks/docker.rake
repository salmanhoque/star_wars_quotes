namespace :docker do
  DOCKER_COMPOSE_FILES = '-f docker-compose.yml -f docker-compose.prod.yml'.freeze

  desc 'create postgres database and volume'
  task :pg_create do
    sh "docker-compose #{DOCKER_COMPOSE_FILES} up -d postgres"
    sh "docker-compose #{DOCKER_COMPOSE_FILES} stop"
  end

  desc 'migrate database schema'
  task :app_db_migration do
    sh "docker-compose #{DOCKER_COMPOSE_FILES} run app_server bundle exec rake db:migrate"
  end

  desc 'add seed data'
  task :app_db_seed do
    sh "docker-compose #{DOCKER_COMPOSE_FILES} run app_server bundle exec rake db:seed"
  end

  desc 'start app'
  task :app_start do
    sh "docker-compose #{DOCKER_COMPOSE_FILES} up"
  end

  desc 'this will delete everything, (this is only to clean up dev)'
  task :reset_all do
    sh "docker-compose #{DOCKER_COMPOSE_FILES} down"
  end

  desc 'this will create pg db, migrate, seed db and start app'
  task :clean_build do
    Rake::Task['docker:reset_all'].invoke
    Rake::Task['docker:pg_create'].invoke
    Rake::Task['docker:app_db_migration'].invoke
    Rake::Task['docker:app_db_seed'].invoke
    Rake::Task['docker:app_start'].invoke
  end
end
