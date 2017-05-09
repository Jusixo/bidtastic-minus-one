Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: "user,user:email"
  provider :google, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']
end
