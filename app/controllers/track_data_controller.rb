class TrackDataController < ApplicationController
  # GET /track_data
  # GET /track_data.json
  def index
    @track_data = TrackDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @track_data }
    end
  end

  # GET /track_data/1
  # GET /track_data/1.json
  def show
    @track_datum = TrackDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @track_datum }
    end
  end

  # GET /track_data/new
  # GET /track_data/new.json
  def new
    @track_datum = TrackDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track_datum }
    end
  end

  # GET /track_data/1/edit
  def edit
    @track_datum = TrackDatum.find(params[:id])
  end

  # POST /track_data
  # POST /track_data.json
  def create
    @track_datum = TrackDatum.new(params[:track_datum])

    respond_to do |format|
      if @track_datum.save
        format.html { redirect_to @track_datum, notice: 'Track datum was successfully created.' }
        format.json { render json: @track_datum, status: :created, location: @track_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @track_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /track_data/1
  # PUT /track_data/1.json
  def update
    @track_datum = TrackDatum.find(params[:id])

    respond_to do |format|
      if @track_datum.update_attributes(params[:track_datum])
        format.html { redirect_to @track_datum, notice: 'Track datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @track_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /track_data/1
  # DELETE /track_data/1.json
  def destroy
    @track_datum = TrackDatum.find(params[:id])
    @track_datum.destroy

    respond_to do |format|
      format.html { redirect_to track_data_url }
      format.json { head :no_content }
    end
  end
end
