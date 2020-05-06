###
### SIDEKIQ from Mic92/mina-sidekiq
################################################################################

set :sidekiq,               "#{bundle_bin} exec sidekiq"
set :sidekiqctl,            "#{bundle_prefix} sidekiqctl"
set :sidekiq_config,        "#{deploy_to}/#{current_path}/config/sidekiq.yml"
set :sidekiq_log,           "#{deploy_to}/#{shared_path}/log/sidekiq.log"
set :sidekiq_pid,           "#{deploy_to}/#{shared_path}/tmp/pids/sidekiq.pid"
set :sidekiq_timeout,       10
set :sidekiq_processes,     1

namespace :sidekiq do
  def for_each_process
    sidekiq_processes.times do |idx|
      pid_file = if idx == 0
                   sidekiq_pid
                 else
                   "#{sidekiq_pid}-#{idx}"
                 end
      yield(pid_file, idx)
    end
  end

  # ### sidekiq:quiet
  desc 'Quiet sidekiq (stop accepting new work)'
  task quiet: :environment do
    queue %[echo "-----> Quiet sidekiq (stop accepting new work)"]
    for_each_process do |pid_file, _idx|
      queue %{
        if [ -f #{pid_file} ] && kill -0 `cat #{pid_file}`> /dev/null 2>&1; then
          cd "#{deploy_to}/#{current_path}"
          #{echo_cmd %(#{sidekiqctl} quiet #{pid_file})}
        else
          echo 'Skip quiet command (no pid file found)'
        fi
      }
    end
  end

  # ### sidekiq:stop
  desc 'Stop sidekiq'
  task stop: :environment do
    queue %(echo "-----> Stop sidekiq")
    for_each_process do |pid_file, _idx|
      queue %[
        if [ -f #{pid_file} ] && kill -0 `cat #{pid_file}`> /dev/null 2>&1; then
          cd "#{deploy_to}/#{current_path}"
          #{echo_cmd %(#{sidekiqctl} stop #{pid_file} #{sidekiq_timeout})}
        else
          echo 'Skip stopping sidekiq (no pid file found)'
        fi
      ]
    end
  end

  # ### sidekiq:start
  desc 'Start sidekiq'
  task start: :environment do
    queue %(echo "-----> Start sidekiq")
    for_each_process do |pid_file, idx|
      queue %(
        cd "#{deploy_to}/#{current_path}"
        #{echo_cmd %(#{sidekiq} -d -e #{rails_env} -C #{sidekiq_config} -i #{idx} -P #{pid_file} -L #{sidekiq_log})}
      )
    end
  end

  # ### sidekiq:restart
  desc 'Restart sidekiq'
  task :restart do
    invoke :'sidekiq:stop'
    invoke :'sidekiq:start'
  end
end
