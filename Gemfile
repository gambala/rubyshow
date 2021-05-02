# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

gem 'amazing_print'
gem 'autoprefixer-rails'
gem 'bootsnap', require: false
gem 'bootstrap-sass'
gem 'bugsnag'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'flag-icons-rails'
gem 'font-awesome-rails'
gem 'lograge'
gem 'mailgun-ruby'
gem 'mina'
gem 'mina-puma', require: false
gem 'mina-scp',  require: false
gem 'oj' # pagy dependency
gem 'omniauth-github', '~> 1.4'
gem 'pagy'
gem 'pg'
gem 'pghero'
gem 'pry'
gem 'pry-rails'
gem 'pry-theme'
gem 'puma', '~> 4.0' # because of capistrano3-puma incompatible with 5.0
gem 'pundit'
gem 'rack-attack'
gem 'rails', '~> 6.0.0'
gem 'rails-i18n'
gem 'rails-plus', github: 'gambala/rails-plus', branch: 'develop'
gem 'rails_performance'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'redis'
gem 'redis-namespace', '1.7.0' # because of Coverband: view_tracker failed to store, error Redis::CommandError
gem 'sass-rails', '>= 6.0'
gem 'slim'
gem 'sprockets'
gem 'table_print'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'

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
  gem 'capistrano3-puma', '~> 4.0'
  gem 'letter_opener'
  gem 'listen'
  gem 'meta_request'
  gem 'rubocop', require: false
  gem 'rubocop-github', github: 'gambala/rubocop-github' # because of Metrics/LineLength warning fix
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-template', require: false, github: 'gambala/rubocop-template'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end
