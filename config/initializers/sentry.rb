Sentry.init do |config|
  config.dsn = ENV["GLITCHTIP_DSN"]
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]
end
