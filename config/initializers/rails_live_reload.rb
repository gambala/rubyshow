# frozen_string_literal: true

RailsLiveReload.configure do |config|
  # config.url = "/rails/live/reload"

  # Default watched folders & files
  config.watch %r{app/views/.+\.(erb|haml|slim)$}

  # More examples:
  config.watch %r{app/helpers/.+\.rb}, reload: :always
  config.watch %r{config/locales/.+\.yml}, reload: :always

  config.enabled = Rails.env.development?
end if defined?(RailsLiveReload)
