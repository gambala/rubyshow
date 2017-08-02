# frozen_string_literal: true

class Rack::Attack
  throttle('req/ip', limit: 300, period: 5.minutes) do |req|
    req.ip
  end

  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path == '/sessions' && req.post?
  end
end
