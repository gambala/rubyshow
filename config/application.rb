# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'
require 'breakpoint'
require 'rbnacl/libsodium'
Bundler.require(*Rails.groups)

module RubyCourses
  class Application < Rails::Application
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.autoload_paths += %W(
      #{config.root}/app/presenters
      #{config.root}/app/queries
    )
    config.encoding = 'utf-8'
    config.i18n.available_locales = %i(ru en)
    config.i18n.default_locale = :ru
    config.load_defaults 5.2
  end
end
