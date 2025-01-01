# frozen_string_literal: true

if defined?(RailsLiveReload)
  RailsLiveReload.configure do |config|
    # config.url = "/rails/live/reload"

    # Default watched folders & files
    config.watch %r{app/views/.+\.(erb|haml|slim)$}

    # More examples:
    config.watch %r{app/helpers/.+\.rb}, reload: :always
    config.watch %r{config/locales/.+\.yml}, reload: :always

    config.enabled = Rails.env.development?
  end
end
