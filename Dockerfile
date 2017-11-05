FROM ruby:2.1.8-alpine

RUN apk update && \
    apk upgrade && \
    apk add bash curl-dev ruby-dev build-base nodejs && \
    rm -rf /var/cache/apk/* && \
    gem update --system 2.6.1 && \
    gem update bundler

COPY . /app-rating

WORKDIR /app-rating

RUN bundle install
