require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "f0c970821ef54840b96c8f7261d2df00", "410ef7af94f14130bb5aafc1aaa3d51f", scope: 'playlist-modify-public'
end
