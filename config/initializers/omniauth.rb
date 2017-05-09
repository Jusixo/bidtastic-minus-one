Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV.fetch('FACEBOOK_KEY'), ENV.fetch('FACEBOOK_SECRET')
  # provider :google, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
end
