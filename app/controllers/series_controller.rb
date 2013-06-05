class SeriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /series
  # GET /series.json
  def index
  @series = Series.search(params[:search]).paginate(page: params[:page], :per_page => 1)
  @pull_list = Series.where(:pull=>true).all 
  @wanted_items = Issue.wanted
	@issues = Issue.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @series }
    end
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Series.find(params[:id])
    @issue = @series.issues

    drop_breadcrumb(@series.title)
  end

  # GET /series/new
  # GET /series/new.json
  def new
    @series = Series.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @series }
    end
  end

  # GET /series/1/edit
  def edit
    @series = Series.find(params[:id])
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(params[:series])

    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series was successfully created.' }
        format.json { render json: @series, status: :created, location: @series }
      else
        format.html { render action: "new" }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /series/1
  # PUT /series/1.json
  def update
    @series = Series.find(params[:id])
    if @series.update_attributes(params[:series])
      redirect_to @series, notice: "Page was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    redirect_to series_url
  end

end
