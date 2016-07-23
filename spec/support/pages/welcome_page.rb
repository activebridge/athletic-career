require 'support/base_page'

class WelcomePage < BasePage
  def login_with(provider, options = { success: true })
    click_link 'Зареєструватися'
    if options[:success]
      OmniAuth.config.mock_auth[provider] = OmniAuth::AuthHash.new(provider: provider, uid: '12345', nname: 'test_username',
                                                                   info: { name: 'test_username', image: 'http://link_to_image.com/image' },
                                                                   credentials: { token: :token, secret: :secret })
    else
      OmniAuth.config.mock_auth[provider] = :invalid_credentials
    end
    click_link 'Увійти через Facebook'
  end
end
