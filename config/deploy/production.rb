# frozen_string_literal: true

require_relative 'forbidden_locations'

server ENV['deploy_host'], port: ENV['deploy_port'], user: ENV['deploy_user'], roles: %w(app db web)
set :forbidden_locations, Deploy::FORBIDDEN_LOCATIONS
set :letsencrypt_path, 'rubycourses.ru'
set :nginx_config_name, 'ruby_courses.production.nginx.conf'
set :nginx_server_name, 'rubycourses.ru'
set :nginx_use_ssl, true
