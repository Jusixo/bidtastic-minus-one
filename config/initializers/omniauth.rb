Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV.fetch('FACEBOOK_KEY'), ENV.fetch('FACEBOOK_SECRET')
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
