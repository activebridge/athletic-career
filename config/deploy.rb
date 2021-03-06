set :application, 'athletic-career'
set :repo_url, 'git@github.com:activebridge/athletic-career.git'

set :deploy_to, '/var/www/athletic-career'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/cloudinary.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :rvm_type, :user
set :bundle_binstubs, nil
set :whenever_identifier, 'bundle exec whenever'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
