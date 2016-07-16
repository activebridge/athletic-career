Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['vk_api_key'], ENV['vk_api_secret']
end
