Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['YT_CLIENT_ID'], ENV['YT_CLIENT_SECRET'],  :client_options => {:ssl => {:ca_file => '/etc/pki/tls/certs/ca-bundle.crt'}, :scope => 'userinfo.profile,youtube'}, provider_ignores_state: true
end