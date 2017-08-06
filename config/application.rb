# frozen_string_literal: true

require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'rbnacl/libsodium'

Bundler.require(*Rails.groups)

module RubyCourses
  class Application < Rails::Application
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }
    config.active_record.raise_in_transactional_callbacks = true
    config.autoload_paths += %W(
      #{config.root}/app/presenters
      #{config.root}/app/queries
    )
    config.encoding = 'utf-8'
    config.i18n.available_locales = %i(ru en)
    config.i18n.default_locale = :ru

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, request_specs: false, routing_specs: false
    end
  end
end
