# frozen_string_literal: true

Bugsnag.configure do |config|
  config.api_key = ENV['BUGSNAG_API_KEY']
  config.notify_release_stages = %w(production)
end
