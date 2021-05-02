# frozen_string_literal: true

Rails.application.configure do
  config.action_controller.asset_host = ENV['app_host']
  config.action_controller.default_url_options = { host: ENV['app_host'] }
  config.action_mailer.asset_host = ENV['app_host']
  config.action_mailer.default_url_options = { host: ENV['app_host'] }
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_storage.service = :local
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.assets.debug = true
  config.assets.quiet = true
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.hosts << ENV['app_domain']
  config.sass.inline_source_maps = true
  config.sass.line_comments = false
  config.sass.preferred_syntax = :sass
  config.webpacker.check_yarn_integrity = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = { 'Cache-Control' => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.after_initialize do
    Bullet.enable = true
    Bullet.console = true
  end

  # config.action_cable.disable_request_forgery_protection = true
  # config.action_view.annotate_rendered_view_with_filenames = true
  # config.i18n.raise_on_missing_translations = true
end
