# frozen_string_literal: true

source 'https://rubygems.org'

# Ruby Version
ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgres as the database
gem 'pg', '~> 0.20.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Bootstrap & UI gems
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bourbon'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Rails Admin gem and dependencies
gem 'rails_admin', '~> 1.0'
gem 'rails_admin-i18n'
gem 'rails_admin_toggleable' # Make any boolean field easily toggleable on\off from index view in rails admin

# Slim
gem 'slim-rails'

# New Relic
gem 'newrelic_rpm'

# Devise
gem 'devise'
gem 'devise-bootstrap-views'

# Carrierwave
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'cloudinary'
gem 'mini_magick'

gem 'delayed_job'
gem 'mechanize'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-faker'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner-active_record'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end
