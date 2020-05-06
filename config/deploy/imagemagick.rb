# imagemagick
namespace :provision do
  desc 'Install the imagemagick library.'
  task :imagemagick do
    command 'sudo apt-get -y install libmagickwand-dev imagemagick'
    command 'sudo apt-get clean -y'
  end
end
