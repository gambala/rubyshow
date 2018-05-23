# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem 'autoprefixer-rails', '7.2.3' # https://github.com/ai/autoprefixer-rails/issues/130
gem 'bootsnap', require: false
gem 'bootstrap-sass'
gem 'breakpoint'
gem 'bugsnag'
gem 'coffee-rails'
gem 'devise'
gem 'dragonfly', '~> 1.0.12'
gem 'figaro'
gem 'font-awesome-rails'
gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'pg', '~> 0.21.0'
gem 'pry'
gem 'pry-doc'
gem 'pry-highlight'
gem 'pry-pretty-numeric'
gem 'pry-rails'
gem 'pry-theme'
gem 'puma'
gem 'pundit'
gem 'rack-attack'
gem 'rails', '~> 5.2.0'
gem 'rails-i18n'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'sass'
gem 'sassc-rails'
gem 'slim'
gem 'stlr'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'
gem 'will_paginate', '~> 3.0.6'
gem 'will_paginate-bootstrap'

# Security
gem 'bcrypt_pbkdf'
gem 'rbnacl'
gem 'rbnacl-libsodium'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara', '~> 2.4.0'
  gem 'capybara-webkit'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner', '~> 1.3'
  gem 'shoulda-matchers', '~> 2.8'
end

group :development do
  gem 'annotate'
  gem 'bullet'
  gem 'byebug', platform: :mri
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-figaro-yml'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rvm'
  gem 'capistrano-touch-linked-files'
  gem 'capistrano3-puma'
  gem 'listen'
  gem 'meta_request'
  gem 'rubocop-template', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
