class ActivitiesController < ApplicationController
  
  before_filter :get_response
  # get_response is defined at the bottom of the file
  # and takes the response_id given by the routing and
  # converts it to an @response object.

  # GET /activities
  # GET /activities.xml
  def index
  @activities = @response.activities
  # was @activities = Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = @response.activities.find(params[:id])
    # was @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = @response.activities.build
    # was @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = @response.activities.find(params[:id])
    # was @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = @response.activities.build(params[:activity])
    # was @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to([@response, @activity]) }
              # was redirect_to(@activity)
        format.xml  { render :xml => @activity, :status => :created, :location => @activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = @response.activities.find(params[:id])
    # was @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to([@response, @activity]) }
	    # was redirect_to(@activity)
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = @response.activities.find(params[:id])
    # was @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(response_activities_path(@response)) }
	# was redirect_to(activities_url)
      format.xml  { head :ok }
    end
  end

private
#get_response converts the response_id given by the routing
# into a @response object, for use her and in the view.
  def get_response
    @response = Response.find(params[:response_id])
  end
end
