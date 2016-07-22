app = '46.101.115.35'
server app, user: 'deploy', roles: %w(app db web)
set :ssh_options, user: 'deploy', port: 5030
