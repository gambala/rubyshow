# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby & Rails performance optimization & deploy
gem "bootsnap", require: false
gem "lograge"
gem "puma"
gem "rack-attack"
gem "rails", "~> 7.2"
gem "rails-i18n"
gem "rails_performance"

# Third-party services
gem "sentry-ruby"
gem "sentry-rails"

# Data
gem "counter_culture"
gem "redis" # → rails_performance
gem "sqlite3"

# Authentication & Authorization
gem "devise"
gem "devise-i18n"
gem "omniauth-github"
gem "omniauth-rails_csrf_protection" # Fixes omniauth v2 CSRF protection issue
gem "pundit"

# REPL
gem "amazing_print"
gem "pry-rails"
gem "table_print"

# Frontend
gem "heroicon"
gem "oj" # → pagy
gem "pagy", "~> 4.11" # Because of undefined method pagy_countless in 5.x
gem "rails-plus", github: "gambala/rails-plus"
gem "recaptcha", require: "recaptcha/rails"
gem "slim"
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
