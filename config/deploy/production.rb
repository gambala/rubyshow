# frozen_string_literal: true

require_relative 'forbidden_locations'

server ENV['deploy_host'], port: ENV['deploy_port'], user: ENV['deploy_user'], roles: %w(app db web)
set :forbidden_locations, Deploy.forbidden_locations
set :letsencrypt_path, 'rubycourses.ru'
set :nginx_config_name, 'ruby_courses.production.nginx.conf'
set :nginx_server_name, 'rubycourses.ru'
set :nginx_use_ssl, false
set :ssh_options, keys: %w(/home/gambala/.ssh/id_rsa),
                  forward_agent: true,
                  auth_methods: %w(publickey)
