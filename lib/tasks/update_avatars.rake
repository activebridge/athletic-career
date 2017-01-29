task update_avatars: :environment do
  facebook = User.where(provider: 'facebook')
  facebook.each do |user|
    connect = Koala::Facebook::API.new(user.token)
    user.update(remote_avatar_url: connect.get_picture_data(user.uid, type: 'large')['data']['url'])
  end
end
