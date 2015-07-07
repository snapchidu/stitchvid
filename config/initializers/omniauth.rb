Rails.application.config.middleware.use OmniAuth::Builder do
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?
provider :google_oauth2, ENV['YT_CLIENT_ID'], ENV['YT_CLIENT_SECRET'], scope: 'userinfo.profile,youtube'
end