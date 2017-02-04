require 'support/base_page'

class WelcomePage < BasePage
  def login_with_facebook(options = { success: true })
    click_link 'Увійти'
    if options[:success]
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(provider: 'facebook', uid: '12345', nname: 'test_username',
                                                                    info: { name: 'test_username', image: 'http://graph.facebook.com/v2.6/633474933485333/picture' },
                                                                    extra: { raw_info: { gender: 'male'}},
                                                                    credentials: { token: :token, secret: :secret })
    else
      OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    end
    click_link 'Увійти за допомогою Facebook'
  end

  def login_with_vk(options = { success: true })
    click_link 'Увійти'
    if options[:success]
      OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(provider: 'vkontakte', uid: '12345', nname: 'test_username',
                                                                    info: { name: 'test_username', image: 'https://pp.vk.me/c5608/v5608812/d9/eV1kHgCYITE.jpg', urls: { "Vkontakte"=>"http://vk.com/id31737812" } },
                                                                    credentials: { token: 'sf23hdsjk', secret: :secret }, extra: { raw_info: { photo_200_orig: 'https://pp.vk.me/c5608/v5608812/d9/eV1kHgCYITE.jpg' }})
    else
      OmniAuth.config.mock_auth[:vkontakte] = :invalid_credentials
    end
    click_link 'Увійти за допомогою VK'
  end
end
