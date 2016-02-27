set :stage, :production
set :branch, "master"

# Это используется в виртуальных хостах Nginx для указания, на каких доменах
# должно появляться приложение. Если вы еще не настроили DNS, вам будет
# необходимо создать записи в вашем локальном файле Hosts для тестирования
set :server_name, "www.rubycourses.ru rubycourses.ru"

# используется в случае, если мы деплоим несколько версий одного приложения
# по-соседству. Также предоставляет быструю проверку корректности путей файлов.
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

server '95.213.191.109', user: 'deploy', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# Не пытайтесь делать вывод о чем-то настолько важном, как среда, из
# названия стейджа
set :rails_env, :production

# количество воркеров unicorn, будет отражено в конфигах
# unicorn.rb и monit
set :unicorn_worker_count, 5

# определяет, используем ли мы ssl или нет, используется для
# файла конфигурации nginx
set :enable_ssl, false
