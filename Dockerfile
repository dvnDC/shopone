FROM ruby:3.1.1

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install --global yarn

# Prepare app directory
RUN mkdir /railsapp
WORKDIR /railsapp

# Install gems
COPY Gemfile /railsapp/Gemfile
COPY Gemfile.lock /railsapp/Gemfile.lock
RUN bundle install

# Copy the main application
COPY . /railsapp

# Expose port 3000 to the Docker host, so we can access it from the outside
EXPOSE 3000

# The main command to run when the container starts
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
