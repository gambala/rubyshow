# Setup
desc 'Setup directories for deployment.'
task :setup do
  command %(mkdir -p "#{fetch(:shared_path)}/log")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/log")

  command %(mkdir -p "#{fetch(:shared_path)}/tmp")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp")

  command %(mkdir -p "#{fetch(:shared_path)}/run")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/run")

  command %(mkdir -p "#{fetch(:shared_path)}/tmp/pids")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/pids")

  command %(mkdir -p "#{fetch(:shared_path)}/tmp/cache")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/cache")

  command %(mkdir -p "#{fetch(:shared_path)}/tmp/sockets")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/tmp/sockets")

  command %(mkdir -p "#{fetch(:shared_path)}/config")
  command %(chmod g+rx,u+rwx "#{fetch(:shared_path)}/config")

  command %(touch "#{fetch(:shared_path)}/config/database.yml")
end
