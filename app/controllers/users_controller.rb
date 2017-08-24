class UsersController < ApplicationController
  def spotify
    $spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    $new_playlist = $spotify_user.create_playlist!($artist1.name + " x " + $artist2.name)
    $new_playlist.add_tracks!($collabTrackList)
  end
end
