FROM ruby:2.3-slim

MAINTAINER <Salman Hoque>

RUN apt-get update && apt-get install -y git-core curl wget \
    iputils-ping build-essential libpq-dev

ENV APP_DIR /srv/app/
RUN mkdir $APP_DIR
WORKDIR $APP_DIR

COPY Gemfile* $APP_DIR
RUN bundle install

COPY . $APP_DIR
