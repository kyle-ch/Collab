Rails.application.routes.draw do
  get 'user/spotify'

  root 'search#index'

  get '/artists', to: 'artists#index'
  get '/artists/playlist', to: 'artists#show', as: 'artist'

  get '/auth/spotify/callback', to: 'users#spotify'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
