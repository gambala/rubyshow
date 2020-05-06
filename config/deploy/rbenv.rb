# rbenv
# TODO: Disble enviorment task preload

# Ruby version to install
set :ruby_version, '2.5.0'

namespace :provision do
  desc "Install ruby #{fetch(:ruby_version)} with rbenv"
  task :rbenv do
    command 'git clone https://github.com/rbenv/rbenv.git ~/.rbenv'
    command 'git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build'

    # Load enviorment manually
    invoke :'rbenv:load'
    command "rbenv install #{fetch(:ruby_version)}"
    command "rbenv global #{fetch(:ruby_version)}"
    command "echo 'gem: --no-ri --no-rdoc' > ~/.gemrc"
    command 'gem install bundler'
    command 'rbenv rehash'
  end
end
