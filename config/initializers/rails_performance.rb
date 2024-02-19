if defined?(RailsPerformance)
  RailsPerformance.setup do |config|
    config.redis = Redis.new(url: "redis://#{ENV["REDIS_HOST"]}:#{ENV["REDIS_PORT"]}/2")
    config.duration = 4.hours
  end
end
