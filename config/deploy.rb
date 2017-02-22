# Change these
set :application, 'ranktopissues'

set :repo_url, "git@github.com:martherton/ranktopissues.git"

set :deploy_to, '/home/deploy/ranktopissues'

append :linked_files, 'config/database.yml', 'config/secrets.yml'

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

