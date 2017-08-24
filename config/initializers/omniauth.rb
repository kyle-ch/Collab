require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "client id", "client secret", scope: 'playlist-modify-public'
end
