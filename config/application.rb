require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Rubyshow
  class Application < Rails::Application
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.encoding = "utf-8"
    config.i18n.available_locales = %i[ru en]
    config.i18n.default_locale = :ru
    config.i18n.load_path = Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
    config.load_defaults 7.1
    config.lograge.enabled = true
  end
end
