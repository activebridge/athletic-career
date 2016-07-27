require 'support/base_page'

class WelcomePage < BasePage
  def login_with_facebook(options = { success: true })
    click_link 'Зареєструватися'
    if options[:success]
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(provider: 'facebook', uid: '12345', nname: 'test_username',
                                                                    info: { name: 'test_username', image: 'http://link_to_image.com/image' },
                                                                    credentials: { token: :token, secret: :secret })
    else
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    end
    click_link 'Увійти через Facebook'
  end

  def login_with_vk(options = { success: true })
    click_link 'Зареєструватися'
    if options[:success]
      OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(provider: 'vkontakte', uid: '12345', nname: 'test_username',
                                                                    info: { name: 'test_username', image: 'http://link_to_image.com/image' },
                                                                    credentials: { token: 'sf23hdsjk', secret: :secret }, extra: { raw_info: { photo_200_orig: 'http://link_to_image.com/image' }})
    else
      OmniAuth.config.mock_auth[:vkontakte] = :invalid_credentials
    end
    click_link 'Увійти через VK'
  end
end
