###
### REDIS
################################################################################

namespace :provision do
  desc 'Install redis server'
  task :redis do
    queue 'sudo add-apt-repository -y ppa:chris-lea/redis-server'
    queue 'sudo apt-get update -y'
    queue 'sudo apt-get install -y redis-server'
    queue 'sudo apt-get clean -y'
  end
end
