class PlaylistDetail < ActiveRecord::Base
  attr_accessible :playlist_id, :track_datum_id, :track_no
  belongs_to :playlist
  belongs_to :track_datum

  def self.find_setlist(playlist_id)
    return PlaylistDetail.where(:playlist_id => playlist_id).order('track_no')
  end

  def self.find_by_playlist_id_and_track_no(playlist_id, track_no)
    return PlaylistDetail.where(:playlist_id => playlist_id, :track_no => track_no).first
  end
end
