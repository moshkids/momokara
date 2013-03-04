class PlaylistDetail < ActiveRecord::Base
  attr_accessible :playlist_id, :track_datum_id, :track_no
  belongs_to :playlist
  belongs_to :track_datum

  def self.find_setlist(playlist_id)
    return PlaylistDetail.where(:playlist_id => playlist_id).order('track_no')
  end
end
