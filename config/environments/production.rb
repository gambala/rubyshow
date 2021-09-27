# frozen_string_literal: true

Rails.application.configure do
  config.action_controller.asset_host = ENV['app_host']
  config.action_controller.default_url_options = { host: ENV['app_host'] }
  config.action_controller.perform_caching = true
  config.action_mailer.asset_host = ENV['app_host']
  config.action_mailer.default_url_options = { host: ENV['app_host'] }
  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = { api_key: ENV['mailgun_api_key'], domain: 'mg.ruby.show',
                                            api_host: 'api.eu.mailgun.net' }
  config.action_mailer.perform_caching = false
  config.active_record.dump_schema_after_migration = false
  config.active_storage.service = :local
  config.active_support.deprecation = :notify
  config.active_support.disallowed_deprecation = :log
  config.active_support.disallowed_deprecation_warnings = []
  config.assets.compile = false
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.eager_load = true
  config.hosts << ENV['app_domain']
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :info
  config.log_tags = [:request_id]
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.require_master_key = true

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_mailer.raise_delivery_errors = false
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "rubyshow_production"
  # config.active_record.database_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
  # config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
  # config.active_record.database_selector = { delay: 2.seconds }
  # config.asset_host = 'http://assets.example.com'
  # config.assets.css_compressor = :sass
  # config.cache_store = :mem_cache_store
  # config.force_ssl = true
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')
  # config.require_master_key = true
  # require "syslog/logger"
end
