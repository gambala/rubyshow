require 'figaro'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

Figaro.application = Figaro::Application.new(environment: 'production',
                                             path: File.expand_path('application.yml', __dir__))
Figaro.load

set :application_name, 'ruby_courses'
set :domain, ENV['deploy_host']
set :port, ENV['deploy_port']
set :deploy_to, '/home/deploy/apps/ruby_courses-production'
set :repository, 'git@github.com:gambala/rubyshow.git'
set :branch, 'master'
set :user, 'deploy'
set :forward_agent, true
set :bundle_path, 'bundle'

# Optional settings:
# set :forward_agent, true     # SSH forward_agent.

# Shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
# Some plugins already add folders to shared_dirs like `mina/rails` add `public/assets`, `vendor/bundle` and many more
# run `mina -d` to see all folders and files already included in `shared_dirs` and `shared_files`
set :shared_dirs, %w(bundle
                     log
                     node_modules
                     public/assets
                     public/sitemaps
                     public/uploads
                     tmp/cache
                     tmp/pids
                     tmp/sockets
                     vendor/bundle)
set :shared_files, %w(config/application.yml)

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :remote_environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-2.6.1-p125@default'
  invoke :'rvm:use', 'ruby-2.6.1'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  # command %{rbenv install 2.3.0 --skip-existing}
end

desc 'Deploys the current version to the server.'
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %(mkdir -p tmp/)
        command '~/.rvm/bin/rvm default do bundle exec pumactl' \
                " -S #{fetch(:deploy_to)}/shared/tmp/pids/puma.state" \
                " -F #{fetch(:deploy_to)}/shared/puma.rb phased-restart"
      end
    end
  end

  # command %(touch tmp/restart.txt)
  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
