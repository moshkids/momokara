class SetlistController < ApplicationController
  def index
    @playlistDetails = PlaylistDetail.find_setlist(params[:id])
    @playlist = @playlistDetails[0].playlist

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
end
