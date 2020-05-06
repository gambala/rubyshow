# Essentials
namespace :provision do
  desc 'Install essential packages required for building ruby and git.'
  task :essentials do
    command 'sudo apt-get update -y'
    command 'sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev'
    command 'sudo apt-get clean -y'
  end
end
