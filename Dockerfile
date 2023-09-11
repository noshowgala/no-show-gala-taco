ARG RUBY_VERSION=3.1.1
FROM ruby:$RUBY_VERSION

RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - \
    && apt-get update && apt-get install -y nodejs git postgresql postgresql-contrib libpq-dev cmake imagemagick bash

RUN gem install rails bundler

WORKDIR /app

RUN mkdir -p tmp/pids

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
