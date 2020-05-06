# Install postgresql database.
# TODO: Refactor variables and setup.

# Database host
set :pg_host, 'localhost'

namespace :provision do
  desc 'Install postgresql.'
  task :postgresql do
    # Ask is provided by highline and will prompt the terminal to enter in a password for the database.
    set :pg_password, ask('Postgresql password: ') { |q|
      q.default = 'password'
    }

    command 'sudo apt-get update -y'
    command 'sudo apt-get -y install libpq-dev postgresql-common postgresql postgresql-contrib'
    command 'sudo apt-get clean -y'

    command %(sudo -u postgres psql -c "create user #{fetch(:app_name)} with password '#{fetch(:pg_password)}';")
    command %(sudo -u postgres psql -c "alter role #{fetch(:app_name)} with superuser;")
    command %(sudo -u postgres psql -c "create database #{fetch(:app_name)}_production owner #{fetch(:app_name)};")

    database_yml = erb("#{fetch(:template_path)}/postgresql.yml.erb")

    command "echo '#{database_yml}' > #{fetch(:shared_path)}/config/database.yml"
    command "cat #{fetch(:shared_path)}/config/database.yml"
  end
end
