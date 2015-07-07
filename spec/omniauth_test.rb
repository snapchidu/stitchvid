module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      'provider' => 'google plus',
      'uid' => '123545',
      'info' => {
        'name' => 'mockuser',
        'image' => 'mock_user_thumbnail_url'
      },
      'credentials' => {
        'token' => 'mock_token',
        'secret' => 'mock_secret'
      }
    })
  end
end