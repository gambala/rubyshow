# nginx

namespace :nginx do
  %w(stop start restart reload status).each do |action|
    desc "#{action.capitalize} NGINX"
    task action.to_sym => :environment do
      # Log the command to the terminal output.
      command %(echo "-----> #{action.capitalize} NGINX")
      # Run the command.
      command "sudo service nginx #{action}"
    end
  end
end

# Install nginx server.
namespace :provision do
  desc 'Install NGINX'
  task :nginx do
    command 'sudo apt-get update -y'
    command 'sudo apt-get install -y nginx'
    command 'sudo apt-get clean -y'

    # Create nginx server file.
    nginx_puma = erb("#{fetch(:template_path)}/nginx_puma.erb")

    command %(echo '#{nginx_puma}' > /home/#{fetch(:user)}/nginx_conf)
    command %(sudo mv /home/#{fetch(:user)}/nginx_conf /etc/nginx/sites-enabled/#{fetch(:app_name)})
    command %(sudo rm -f /etc/nginx/sites-enabled/default)
  end
end
