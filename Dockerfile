ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
    && apt-get update && apt-get install -y nodejs git postgresql postgresql-contrib libpq-dev cmake imagemagick bash

RUN gem install rails bundler
RUN gem install rails
