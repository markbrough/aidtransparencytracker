class ResponsesController < ApplicationController
 before_filter :require_user
  # GET /responses
  # GET /responses.xml
  def index

    @responses = Response.all
    @responses_user = Response.find(:all, :conditions => { :user_id => current_user.id, :status => 10 } ) 
    @responses_user_submitted = Response.find(:all, :conditions => { :user_id => current_user.id, :status => 11 } ) 
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
    @response_params = params[:response]
    @response_params[:user_id] = current_user.id
    # it's a CSO/user response
    @response_params[:status] = '10'
    @response_params[:entry_date] = Date.today
    @response = Response.new(@response_params)

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

    
  	@response.attributes = params[:response]

	  @response.activities.each { |a| a.attributes = params[:activity][a.id.to_s] }
	  if @response.valid? && @response.activities.all?(&:valid?)
	    @response.save!
	    @response.activities.each(&:save!)
	    redirect_to :action => 'show', :id => @response
	  else
	    render :action => 'edit'
	  end

	  
  end

  def submit_this
     @responses_user = Response.find(:all, :conditions => { :user_id => current_user.id } )

	@dothisone = ""
	# prepare params
	@theparams = {}
	@responses_user.each do |response|

		if (params[:"#{response.id}"] == '1')

		   # @activity_params = params["#{question.id}"]
		   # @activity_params[:entry_date] = Date.today
		   # @activity = @response.activities.build(@activity_params)
	
			@theparams[:id] = response.id.to_s
			@theparams[:status] = 11
			@response = Response.find(response.id)
			@response.attributes = @theparams
			@response.save!
		end

	end

    respond_to do |format|
      format.html { redirect_to(responses_url) }
      format.xml  { head :ok }
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
