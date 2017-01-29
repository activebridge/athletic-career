env :PATH, ENV['PATH']
set :output, "#{path}/log/cron.log"

every 2.days, at: '6pm' do
  rake 'update_avatars'
end
