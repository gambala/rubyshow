RailsPerformance.setup do |config|
  config.redis = Redis::Namespace.new(
    "ruby_courses-#{Rails.env}-rails-performance",
    redis: Redis.new(url: "redis://#{ENV['redis_host']}", password: ENV['redis_password'])
  )

  config.duration = 4.hours
end if defined?(RailsPerformance)
