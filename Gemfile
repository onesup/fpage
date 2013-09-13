source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'devise', '~> 3.1.0'
gem 'the_role', '~> 2.1.0'
gem 'bootstrap-sass', '~> 2.3.2.2'
group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem "pry"
  gem 'capistrano', github: "capistrano/capistrano"
  gem 'guard-rails'
end

group :production do
  # gem 'rb-readline', '~> 0.5.0'
end

group :test do
  gem 'capybara'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem "database_cleaner"
  gem "email_spec"
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end
