# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'
gem 'activestorage', '~> 7.0'
gem 'bootsnap', require: false
gem 'pg'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'rails_12factor'
gem 'rubocop', require: false
gem 'rubocop-rails'
gem 'sprockets-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'byebug'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'simplecov', require: false
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
