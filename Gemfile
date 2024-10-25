# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8', '>= 7.0.8.6'
gem 'rubocop', '~> 1.67'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.5', '>= 3.5.1'
  gem 'rspec', '~> 3.4'
  gem 'rspec-rails', '~> 7.0', '>= 7.0.1'
  gem 'shoulda-matchers', '~> 6.2'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
