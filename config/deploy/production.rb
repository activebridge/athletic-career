app = '46.101.152.227'
server app, user: 'deploy', roles: %w(app db web)
set :ssh_options, user: 'deploy', port: 5030
