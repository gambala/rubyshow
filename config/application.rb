# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Rubyshow
  class Application < Rails::Application
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.autoloader = :zeitwerk
    config.encoding = 'utf-8'
    config.i18n.available_locales = %i(ru en)
    config.i18n.default_locale = :ru
    config.i18n.load_path = Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.load_defaults 6.1
    config.lograge.enabled = true
  end
end
