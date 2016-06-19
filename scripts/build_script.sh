#!/bin/bash

echo '--> Check postgres container'
docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d postgres
docker-compose -f docker-compose.yml -f docker-compose.test.yml stop

echo '--> Run migrations'
docker-compose -f docker-compose.yml -f docker-compose.test.yml run app_server bundle exec rake db:migrate

echo '--> Run app'
docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d
