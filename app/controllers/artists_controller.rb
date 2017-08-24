class ArtistsController < ApplicationController
  include ArtistsHelper
  def index
    if !params[:artist1_name].empty? && !params[:artist2_name].empty?
      @artist1list = RSpotify::Artist.search(params[:artist1_name])
      @artist2list = RSpotify::Artist.search(params[:artist2_name])
    else
      redirect_to root_path
    end
  end

  def show
    @allTracks = []
    $collabTrackList = []
    $artist1 = RSpotify::Artist.find(params[:artist1_id])
    $artist2 = RSpotify::Artist.find(params[:artist2_id])
    $artist1.albums(country: 'US').each do |album|
      album.tracks.each do |track|
        @allTracks << track
      end
    end
    $artist2.albums(country: 'US').each do |album|
      album.tracks.each do |track|
        @allTracks << track
      end
    end
    @allTracks.each do |track|
      track_artists = track.artists
      containsArtist1 = false
      containsArtist2 = false
      track_artists.each do |artist|
        containsArtist1 ||= artist.id.eql?(params[:artist1_id])
        containsArtist2 ||= artist.id.eql?(params[:artist2_id])
      end
      if containsArtist1 && containsArtist2 && !tracklistContains($collabTrackList,
                                                                  track.name)
        $collabTrackList << track
      end
    end
  end
end
