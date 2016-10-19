module SessionMethods
  def client_avatar(provider)
    if provider == 'vkontakte'
      auth_hash[:extra][:raw_info][:photo_200_orig]
    else
      auth_hash[:info][:image] + '?type=large'
    end
  end

  def user_gender(provider)
    if provider == 'vkontakte'
      gender = auth_hash[:extra][:raw_info][:sex]
      gender == 2 ? 'male' : 'female'
    else
      auth_hash[:extra][:raw_info][:gender]
    end
  end

  def user_url(provider)
    if provider == 'vkontakte'
      auth_hash[:info][:urls][:Vkontakte]
    else
      "https://www.facebook.com/#{auth_hash[:extra][:raw_info][:id]}"
    end
  end
end
