# frozen_string_literal: true

Bugsnag.configure do |config|
  config.api_key = ENV['bugsnag_api_key']
  config.notify_release_stages = %w(production)
end
