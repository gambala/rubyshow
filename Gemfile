# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby file: ".ruby-version"

# Ruby & Rails performance optimization & deploy
gem "lograge"                  # ✅
gem "puma"                     # 🟠 falcon/iodine
gem "rack-attack"              # ✅
gem "rails", "~> 8.0"          # ✅
gem "rails-i18n"               # ✅

# Engines
gem "rails_performance"        # ✅

# Third-party services
gem "sentry-ruby"              # 🟠 better options? ➡️ app.glitchtip.com
gem "sentry-rails"             # 🟠 better options? ➡️ app.glitchtip.com

# Data
gem "counter_culture"          # 🟠 simpler solution?
gem "redis"                    # ➡️ rails_performance
gem "sqlite3"                  # ✅

# Authentication & Authorization
gem "devise"                         # 🟠 rodauth?
gem "devise-i18n"                    # ➡️ devise
gem "omniauth-github"                # ✅
gem "omniauth-rails_csrf_protection" # ✅ fixes omniauth v2 CSRF protection issue
gem "pundit"                         # ✅ active policy?

# REPL
gem "amazing_print"            # ✅
gem "groupdate"                # ✅
gem "hightop"                  # ✅ # .top(:field) ← .group(:field).count.sort_by_value
gem "table_print"              # ✅

# Frontend
gem "oj"                       # ➡️ pagy (js nav only)
gem "pagy", "~> 9.3"           # ✅
gem "rails-plus", github: "gambala/rails-plus" # 🔴 remove
gem "rails_heroicon"           # ✅ for Rails SSR
gem "recaptcha", require: "recaptcha/rails" # 🟠 better options?
gem "slim"                     # ✅
gem "turbo-rails"              # ✅
gem "vite_rails"               # ✅ but it doesn't support package.json5/yaml

# Mailers
gem "mailgun-ruby"             # ✅
gem "mime-types", require: "mime/types/columnar" # ➡️ mailgun
# hack to reduce memory usage, https://github.com/schneems/derailed_benchmarks

# Uncategorized
gem "csv"                      # ➡️ rails_performance, it's not a part of std library from Ruby 3.4+

group :development do
  gem "annotaterb"             # ✅
  gem "bullet"                 # ✅
  gem "dockerfile-rails"       # ✅
  gem "dotenv"                 # ✅
  gem "letter_opener"          # ✅
  gem "memory_profiler"        # ➡️ rack-mini-profiler
  gem "rack-mini-profiler"     # ✅
  gem "stackprof"              # ➡️ rack-mini-profiler
  gem "standard"               # ✅
  gem "web-console"            # ✅
end
