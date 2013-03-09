class SetlistController < ApplicationController
  def index
    @playlistDetails = PlaylistDetail.find_setlist(params[:id])
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlistDetails }
    end
  end

  def edit
    @playlistDetails = PlaylistDetail.find_setlist(params[:id])
    @playlist = @playlistDetails[0].playlist

    respond_to do |format|
      format.html # edit.html.erb
    end
  end

  def edit_update
    @playlist = Playlist.find(params[:id])

    PlaylistDetail.transaction do
      PlaylistDetail.delete_all("playlist_id = #{@playlist.id}")
      newLists = params[:track_id]
      i = 1
      for track_id in newLists do
        track = TrackDatum.find(track_id)
        detail = PlaylistDetail.new(:track_no => i)
        detail.track_datum_id = track.id
        detail.playlist_id = @playlist.id
        detail.save!
        i += 1
      end
      redirect_to "/setlist/#{@playlist.id}"
    end
  rescue => e
    render :text => e
  end

  def add
    @playlistDetails = PlaylistDetail.find_setlist(params[:id])
    @playlist = Playlist.find(params[:id])
    @tracks = TrackDatum.select_add_data(params[:id])
    respond_to do |format|
      format.html # add.html.erb
    end
  end

  def add_update
    playlist = Playlist.find(params[:id])
    playlistDetails = PlaylistDetail.find_setlist(params[:id])
    next_count = playlistDetails.length + 1
    trackIds = params[:track_id]
    if !trackIds.nil?
      for trackId in trackIds
        PlaylistDetail.create(:playlist_id => playlist.id, :track_datum_id => trackId, :track_no => next_count)
        next_count += 1
      end
    end
    redirect_to "/setlist/#{playlist.id}"
  end
end
