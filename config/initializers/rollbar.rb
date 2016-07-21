Rollbar.configure do |config|
  config.access_token = ENV['rollbar_key']

  config.enabled = false if Rails.env.development? || Rails.env.test?
end
