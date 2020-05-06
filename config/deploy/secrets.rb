# Secrets
# TODO: Don't use exec
namespace :secrets do
  desc 'Upload secret configuration files.'
  task :upload do
    exec "scp -i #{fetch(:identity_file)} #{fetch(:app_root)}/config/{application,secrets}.yml  #{file} #{fetch(:user)}@#{fetch(:domain)}:#{fetch(:shared_path)}/config/"
  end
end
