app = '104.131.59.157'
server app, user: 'deploy', roles: %w(app db web)
set :ssh_options, user: 'deploy', port: 5030
