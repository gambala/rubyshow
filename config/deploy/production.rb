# frozen_string_literal: true

set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '163.172.176.28', user: 'deploy', roles: %w(web app)
