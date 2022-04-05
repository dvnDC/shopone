FROM ruby:3.1.1

RUN apt-get update -qq && apt-get install -y postgresql-client
RUN mkdir /railsapp
WORKDIR /railsapp
COPY Gemfile /railsapp/Gemfile
COPY Gemfile.lock /railsapp/Gemfile.lock
RUN bundle install
COPY . /railsapp

EXPOSE 3000

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
