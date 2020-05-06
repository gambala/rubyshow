# Puma
namespace :puma do
  desc 'Update puma config.'
  task :config do
    puma_config = erb("#{fetch(:template_path)}/puma.rb.erb")
    command %(echo '#{puma_config}' > #{fetch(:shared_path)}/config/puma.rb)
  end
end
