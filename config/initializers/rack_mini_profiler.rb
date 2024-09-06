if Rails.env.development?
  Rack::MiniProfiler.config.authorization_mode = :allow_all
  Rack::MiniProfiler.config.backtrace_threshold_ms = 2 # Hides backtraces for fast SQL queries
  Rack::MiniProfiler.config.enable_advanced_debugging_tools = true
  Rack::MiniProfiler.config.flamegraph_mode = :object
  Rack::MiniProfiler.config.flamegraph_sample_rate = 1
  Rack::MiniProfiler.config.show_total_sql_count = true
  Rack::MiniProfiler.config.storage = Rack::MiniProfiler::FileStore
end
