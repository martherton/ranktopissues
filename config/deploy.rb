# Change these
set :application, 'ranktopissues'

set :repo_url, "git@github.com:martherton/ranktopissues.git"

set :deploy_to, '/var/www/ranktopissues'

set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :unicorn_config, "#{current_path}/config/unicorn.rb"

set :unicorn_binary, "unicorn"

append :linked_files, 'config/database.yml', 'config/secrets.yml'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

namespace :unicorn do
  desc 'Stop Unicorn'
  task :stop do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        execute :kill, capture(:cat, fetch(:unicorn_pid))
      end
    end
  end

  desc 'Start Unicorn'
  task :start do
    on roles(:app) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, "exec unicorn -c #{fetch(:unicorn_config)} -D"
        end
      end
    end
  end

  desc 'Reload Unicorn without killing master process'
  task :reload do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        execute :kill, '-s USR2', capture(:cat, fetch(:unicorn_pid))
      else
        error 'Unicorn process not running'
      end
    end
  end

  desc 'Restart Unicorn'
  task :restart
  before :restart, :stop
  before :restart, :start
end

after "deploy:cleanup", "unicorn:restart"