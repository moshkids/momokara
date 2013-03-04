class PlaylistDetailsController < ApplicationController
  def setlist
    @setlist = PlaylistDetail.find_setlist(params[:id])

    respond_to do |format|
      format.html #setlist.html.erd
    end
  end

  # GET /playlist_details
  # GET /playlist_details.json
  def index
    @playlist_details = PlaylistDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playlist_details }
    end
  end

  # GET /playlist_details/1
  # GET /playlist_details/1.json
  def show
    @playlist_detail = PlaylistDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playlist_detail }
    end
  end

  # GET /playlist_details/new
  # GET /playlist_details/new.json
  def new
    @playlist_detail = PlaylistDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playlist_detail }
    end
  end

  # GET /playlist_details/1/edit
  def edit
    @playlist_detail = PlaylistDetail.find(params[:id])
  end

  # POST /playlist_details
  # POST /playlist_details.json
  def create
    @playlist_detail = PlaylistDetail.new(params[:playlist_detail])

    respond_to do |format|
      if @playlist_detail.save
        format.html { redirect_to @playlist_detail, notice: 'Playlist detail was successfully created.' }
        format.json { render json: @playlist_detail, status: :created, location: @playlist_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @playlist_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playlist_details/1
  # PUT /playlist_details/1.json
  def update
    @playlist_detail = PlaylistDetail.find(params[:id])

    respond_to do |format|
      if @playlist_detail.update_attributes(params[:playlist_detail])
        format.html { redirect_to @playlist_detail, notice: 'Playlist detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playlist_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_details/1
  # DELETE /playlist_details/1.json
  def destroy
    @playlist_detail = PlaylistDetail.find(params[:id])
    @playlist_detail.destroy

    respond_to do |format|
      format.html { redirect_to playlist_details_url }
      format.json { head :no_content }
    end
  end
end
