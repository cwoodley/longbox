class VolumesController < ApplicationController
  before_filter :series_id
  before_filter :authenticate_user!, except: [:index, :show]
  
  # GET /volumes
  # GET /volumes.json
  def index
    if params[:id]
      @volumes = Series.find(params[:id]).volumes
    else
      @volumes = Volume.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @volumes }
    end
  end

  # GET /volumes/1
  # GET /volumes/1.json
  def show
    @volume = Volume.find(:first, :conditions => {:series_id => @series_id, :volume_number => params[:id]})
    @series = Series.find(params[:series_id])

    drop_breadcrumb(@series.title, series_path(@volume.series.slug))
    drop_breadcrumb(@volume.volume_number)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @volume }
    end
  end

  # GET /volumes/new
  # GET /volumes/new.json
  def new
    @volume = Volume.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @volume }
    end
  end

  # GET /volumes/1/edit
  def edit
    @volume = volume.find(:first, :conditions => {:series_id => @series_id, :volume_number => params[:id]})
  end

  # POST /volumes
  # POST /volumes.json
  def create
    @volume = Volume.new(params[:volume])
    @series = Series.where(:slug => params[:series_id])

    respond_to do |format|
      if @volume.save
        format.html { redirect_to series_volume_path(@volume.series,@volume.volume_number), notice: 'volume was successfully created.' }
        format.json { render json: @volume, status: :created, location: @volume }
      else
        format.html { render action: "new" }
        format.json { render json: @volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /volumes/1
  # PUT /volumes/1.json
  def update
    @volume = Volume.find(params[:id])

    respond_to do |format|
      if @volume.update_attributes(params[:volume])
        format.html { redirect_to series_volume_path(@volume.series,@volume.volume_number), notice: 'volume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @volume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volumes/1
  # DELETE /volumes/1.json
  def destroy
    @volume = Volume.find(params[:id])
    @volume.destroy

    respond_to do |format|
      format.html { redirect_to series_path(@volume.series) }
      format.json { head :no_content }
    end
  end

  private

  def series_id
    @series_id = Series.where(:slug => params[:series_id])
  end

end
