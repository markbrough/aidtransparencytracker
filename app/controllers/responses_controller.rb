class ResponsesController < ApplicationController
 before_filter :require_user
  # GET /responses
  # GET /responses.xml
  def index

    @responses = Response.all
    @responses_user = Response.find(:all, :conditions => { :user_id => current_user.id } ) 

#    @responses_donors = Response.find(:all, :group=>"donor_id")
   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responses }
    end


  end

  # GET /responses/1
  # GET /responses/1.xml
  def show
    @response = Response.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @response }
    end
  end

  # GET /responses/new
  # GET /responses/new.xml
  def new
    @response = Response.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @response }
    end
  end

  # GET /responses/1/edit
  def edit
    @response = Response.find(params[:id])
  end

  # POST /responses
  # POST /responses.xml
  def create
    @response = Response.new(params[:response])

    respond_to do |format|
      if @response.save
        flash[:notice] = 'Response was successfully created.'

	if @response.response_type == 1
		format.html { redirect_to(new_response_activity_path(@response)) }
		format.xml  { render :xml => @response, :status => :created, :location => @response }
	elsif @response.response_type == 2
		format.html { redirect_to(new_response_data_country_path(@response)) }
		format.xml  { render :xml => @response, :status => :created, :location => @response }	
	elsif @response.response_type == 3
		format.html { redirect_to(new_response_data_organisation_path(@response)) }
		format.xml  { render :xml => @response, :status => :created, :location => @response }
	end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /responses/1
  # PUT /responses/1.xml
  def update
    @response = Response.find(params[:id])

    respond_to do |format|
      if @response.update_attributes(params[:response])
        flash[:notice] = 'Response was successfully updated.'
        format.html { redirect_to(@response) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.xml
  def destroy
    @response = Response.find(params[:id])
    @response.destroy

    respond_to do |format|
      format.html { redirect_to(responses_url) }
      format.xml  { head :ok }
    end
  end
end
