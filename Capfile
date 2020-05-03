# frozen_string_literal: true

set :deploy_config_path, 'cap/deploy.rb'
set :stage_config_path, 'cap/deploy'

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/rails/console'
require 'capistrano/figaro_yml'
require 'capistrano/touch-linked-files'
require 'capistrano/puma'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Monit
install_plugin Capistrano::Puma::Nginx
