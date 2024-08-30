# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bootsnap", require: false
gem "counter_culture"
gem "lograge"
gem "puma"
gem "rack-attack"
gem "rails", "~> 7.1.3"
gem "rails-i18n"
gem "sentry-ruby"
gem "sentry-rails"

# Accessories
gem "pg"
gem "redis" # → rails_performance

# Authentication & Authorization
gem "devise"
gem "devise-i18n"
gem "omniauth-github"
gem "omniauth-rails_csrf_protection" # Fixes omniauth v2 CSRF protection issue
gem "pundit"

# Console better experience
gem "amazing_print"
gem "pry-rails"
gem "table_print"

# Full-feature engines
gem "pghero"
gem "rails_performance"

# Frontend libraries
gem "flag-icons-rails"
gem "heroicon"
gem "oj" # → pagy
gem "pagy", "~> 4.11" # Because of undefined method pagy_countless in 5.x
gem "rails-plus", github: "gambala/rails-plus", branch: "develop"
gem "recaptcha", require: "recaptcha/rails"
gem "sass-rails", ">= 6.0"
gem "slim"
gem "sprockets-rails"
gem "turbo-rails"
gem "vite_rails"

# Mailers
gem "mailgun-ruby"
gem "mime-types", require: "mime/types/columnar" # → mailgun
  # hack to reduce memory usage, https://github.com/schneems/derailed_benchmarks

group :development do
  gem "annotate"
  gem "bullet"
  gem "dockerfile-rails", ">= 1.6"
  gem "dotenv"
  gem "letter_opener" # → Mailers
  gem "listen" # → rails_live_reload
  gem "memory_profiler" # → rack-mini-profiler
  gem "rack-mini-profiler"
  gem "rails_live_reload"
  gem "stackprof" # → rack-mini-profiler
  gem "standard"
  gem "web-console"
end
