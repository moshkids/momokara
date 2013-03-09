class TrackDatum < ActiveRecord::Base
  attr_accessible :lyric, :time, :title

  def self.select_add_data(playlist_id)
    details = PlaylistDetail.where(:playlist_id => playlist_id)
    exclusion_ids = Array.new
    for detail in details
      exclusion_ids.push(detail.track_datum.id)
    end
    if exclusion_ids.empty?
      return TrackDatum.order(:id).all
    else
      return TrackDatum.where("id not in (?)", exclusion_ids).order(:id).all
    end
  end
end
