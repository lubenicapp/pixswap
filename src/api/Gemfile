# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3"

gem "puma", "~> 5.0"

gem 'rspec'
gem 'rspec-rails'

gem "jbuilder"
gem 'json'

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "bootsnap", require: false

group :development, :test do
  gem 'database_cleaner-active_record'
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot'
  gem 'faker'
  gem 'sqlite3'
end


gem "devise", "~> 4.8"
gem "jwt", "~> 2.3"
gem "mysql2", "~> 0.5.4"
gem "rubocop-rails", "~> 2.14"
