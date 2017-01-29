task update_avatars: :environment do
  facebook = User.where(provider: 'facebook')
  facebook.each do |user|
    begin
      connect = Koala::Facebook::API.new(user.token)
      user.update(remote_avatar_url: connect.get_picture_data(user.uid, type: 'large')['data']['url'])
    rescue StandardError => e
      puts e.backtrace
    end
  end
end
