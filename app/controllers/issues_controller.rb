class IssuesController < ApplicationController
  before_filter :series_id
  #before_filter :authenticate_user!, except: [:index, :show]
  
  # GET /issues
  # GET /issues.json
  def index
    if params[:id]
      @issues = Series.find(params[:id]).issues
    else
      @issues = Issue.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(:first, :conditions => {:series_id => @series_id, :issue_number => params[:id]})
    @series = Series.find(params[:series_id])

    drop_breadcrumb(@series.title, series_path(@issue.series.slug))
    drop_breadcrumb(@issue.issue_number)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(:first, :conditions => {:series_id => @series_id, :issue_number => params[:id]})
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])
    @series = Series.where(:slug => params[:series_id])

    respond_to do |format|
      if @issue.save
        format.html { redirect_to series_issue_path(@issue.series,@issue.issue_number), notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(:first, :conditions => {:series_id => @series_id, :issue_number => params[:id]})

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to series_issue_path(@issue.series,@issue.issue_number), notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to series_path(@issue.series) }
      format.json { head :no_content }
    end
  end

  private

  def series_id
    @series_id = Series.where(:slug => params[:series_id])
  end

end
