FROM ruby:3.1.0

RUN bundle config --global frozen 1
RUN mkdir -p /app
RUN gem install bundler:2.4.7

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . /app

EXPOSE 3000
