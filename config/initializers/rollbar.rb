# frozen_string_literal: true

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN']
  config.enabled = false if Rails.env.test?
  config.environment = ENV['ROLLBAR_ENV'] || Rails.env
end
