class LyricController < ApplicationController

  layout 'lyric'

  def index
    @playlistDetail = PlaylistDetail.find(params[:id])
    @track = @playlistDetail.track_datum
    @nextNo = @playlistDetail.track_no
    @nextNo += 1
    @nextPlaylistDetail = PlaylistDetail.find_by_playlist_id_and_track_no(@playlistDetail.playlist_id, @nextNo)

    respond_to do |format|
      format.html # lyric.html.erb
    end
  end
end
