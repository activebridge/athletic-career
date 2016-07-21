module SessionMethods
  def client_avatar(provider)
    if provider == 'vkontakte'
      auth_hash[:extra][:raw_info][:photo_200_orig]
    else
      auth_hash[:info][:image] + '?type=large'
    end
  end
end
