source 'https://rubygems.org'
ruby "1.9.3"

gem 'rails',     github: 'rails/rails'
gem 'arel',      github: 'rails/arel'
gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'

gem 'pg'

group :assets do
  gem "bootstrap-sass"
  gem "bootswatch-rails"
  gem 'modernizr-rails'
  gem 'sprockets-rails', github: 'rails/sprockets-rails'
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'devise', github: 'idl3/devise', branch: 'rails4'
gem 'sanitize'
gem 'rack-policy'

gem "puma"

group :development, :test do
  gem "rspec-rails"
  gem "jasmine"
  gem "jasmine-ajax"
  gem "bullet"
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
end
