module ArtistsHelper

  def tracklistContains(tracklist, title)
    tracklist.each do |track|
      if track.name.eql?(title)
        return true
      end
    end
    false
  end

end
