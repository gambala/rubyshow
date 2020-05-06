# Install Node.js for JavaScript runtime. (V8 Engine)

namespace :provision do
  desc 'Install nodejs for a javascript runtime'
  task :nodejs do
    command 'sudo apt-get -y install nodejs'
    command 'sudo apt-get clean -y'
  end
end
