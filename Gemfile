source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Databases
gem 'pg'

# Better server
gem 'thin'

# Admin interface
# TODO: Stop tracking edge as soon as Rails 4 support is stable
gem 'activeadmin', github: 'gregbell/active_admin'

# Styles
gem 'sass-rails', '~> 4.0.0'
gem 'compass-rails'
gem 'bootstrap-sass', '~> 3.1.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# SPA
gem 'angularjs-rails'
gem 'rails-assets-restangular'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# JSON/XML api
# TODO: Start using official repo
gem 'active_model_serializers', github: 'alcesleo/active_model_serializers', branch: 'features/xml-support'

# Pagination
gem 'kaminari', '~> 0.15.1'
gem 'api-pagination'

# url/email validation
gem 'validates_formatting_of', '~> 0.8.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'factory_girl_rails', '~> 4.3.0'
  gem 'guard-rspec'
end

group :test do
  gem 'shoulda-matchers'
  gem 'faker', '~> 1.1.2'
  gem 'capybara', '~> 2.1.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'launchy', '~> 2.3.0'
  gem 'selenium-webdriver', '~> 2.35.1'
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

# Enable features in Heroku
gem 'rails_12factor', group: :production

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
