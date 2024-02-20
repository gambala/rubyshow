# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "mime-types", require: "mime/types/columnar" # hack for free memory – https://github.com/schneems/derailed_benchmarks

gem "amazing_print"
gem "autoprefixer-rails"
gem "bootsnap", require: false
gem "bugsnag"
gem "counter_culture"
gem "cssbundling-rails"
gem "devise"
gem "devise-i18n"
gem "flag-icons-rails"
gem "heroicon"
gem "jsbundling-rails"
gem "lograge"
gem "mail"
gem "mailgun-ruby"
gem "mini_racer", "~> 0.7.0" # 0.8.x has libv8-node 18.16.0 which has issues on musl-linux
#                              execjs (autoprefixer coffee-script terser/uglifier) dependency
gem "oj" # pagy dependency
gem "omniauth-github", "~> 1.4" # because of possible bug https://github.com/heartcombo/devise/issues/5236
gem "pagy", "~> 4.11" # Because of undefined method pagy_countless in 5.x
gem "pg"
gem "pghero"
gem "pry-rails"
gem "puma"
gem "pundit"
gem "rack-attack"
gem "rails", "~> 7.1.3"
gem "rails-i18n"
gem "rails-plus", github: "gambala/rails-plus", branch: "develop"
gem "rails_performance"
gem "recaptcha", require: "recaptcha/rails"
gem "redis"
gem "sass-rails", ">= 6.0"
gem "slim"
gem "sprockets-rails"
gem "table_print"
gem "turbolinks" # Waiting for fix https://github.com/hotwired/turbo-rails/issues/122

group :development do
  gem "annotate"
  gem "bullet"
  gem "dotenv-rails"
  gem "letter_opener"
  gem "memory_profiler" # rack-mini-profiler dependency
  gem "rack-mini-profiler"
  gem "rails_live_reload"
  gem "stackprof" # rack-mini-profiler dependency
  gem "standard"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
