# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'mime-types', require: 'mime/types/columnar' # hack for free memory – https://github.com/schneems/derailed_benchmarks

gem 'amazing_print'
gem 'autoprefixer-rails'
gem 'bootsnap', require: false
gem 'bugsnag'
gem 'counter_culture'
gem 'cssbundling-rails'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'flag-icons-rails'
gem 'heroicon', '0.4.0' # because of "Failed to find heroicon: login" message in 1.0
gem 'jsbundling-rails'
gem 'lograge'
gem 'mail', '2.7.1' # because of the 1ms render bug in 2.8.0 and 2.9.edge
gem 'mailgun-ruby'
gem 'mina'
gem 'mina-puma', require: false
gem 'mina-scp',  require: false
gem 'oj' # pagy dependency
gem 'omniauth-github', '~> 1.4' # because of possible bug https://github.com/heartcombo/devise/issues/5236
gem 'pagy', '~> 4.11' # Because of undefined method pagy_countless in 5.x
gem 'pg'
gem 'pghero'
gem 'pry-rails'
gem 'puma', '~> 4.0' # because of capistrano3-puma incompatible with 5.0
gem 'pundit'
gem 'rack-attack'
gem 'rails', '~> 6.1.0'
gem 'rails-i18n'
gem 'rails-plus', github: 'gambala/rails-plus', branch: 'develop'
gem 'rails_performance'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'redis'
gem 'redis-namespace'
gem 'sass-rails', '>= 6.0'
gem 'slim'
gem 'sprockets'
gem 'table_print'
gem 'turbolinks' # Waiting for fix https://github.com/hotwired/turbo-rails/issues/122

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
  gem 'memory_profiler' # rack-mini-profiler dependency
  gem 'rack-mini-profiler'
  gem 'rubocop', require: false
  gem 'rubocop-github', github: 'gambala/rubocop-github' # because of Metrics/LineLength warning fix
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-template', require: false, github: 'gambala/rubocop-template'
  gem 'stackprof' # rack-mini-profiler dependency
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
