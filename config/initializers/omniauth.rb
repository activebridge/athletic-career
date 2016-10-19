Rails.application.config.middleware.use OmniAuth::Builder do
  provider :vkontakte, ENV['vk_api_key'], ENV['vk_api_secret']
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret'], scope: 'public_profile, email', info_fields: 'email, name, first_name, last_name, gender'
end
