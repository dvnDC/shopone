source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.2.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.6"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bcrypt", "~> 3.1.7"
# gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb

# Image handling. "TODO: check and delete unused"
gem "mini_magick"
gem "image_processing"
gem 'ffi'
gem 'ruby-vips' # install libvips-dev || libvips is used as an image processing engine by sharp (on node.js), bimg, sharp for Go, Ruby on Rails
gem 'active_storage_validations'

gem "will_paginate", "3.3.1"

    # Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
# Use Sass to process CSS
# gem "sassc-rails"

group :development do
  gem "web-console"
  gem "amazing_print"
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"                # - Don't know how to build task 'assets:precompile'  # # - 'method_missing': undefined method `assets'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'guard'
  gem 'guard-minitest'
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'rails-controller-testing', '1.0.5' #TODO: rework tests then delete
  gem 'simplecov', require: false
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end