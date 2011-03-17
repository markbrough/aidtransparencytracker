class DataOrganisationsController < ApplicationController

  before_filter :get_response

  # GET /data_organisations
  # GET /data_organisations.xml
  def index

  @data_organisations = @response.data_organisations
    # was @data_organisations = DataOrganisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_organisations }
    end
  end

  # GET /data_organisations/1
  # GET /data_organisations/1.xml
  def show

    @data_organisation = DataOrganisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_organisation }
    end
  end

  # GET /data_organisations/new
  # GET /data_organisations/new.xml
  def new
    @questions = Question.find(:all, :order => :id, :conditions => { :question_type => 3 } )

    @data_organisation = @response.data_organisations.build
    # @data_organisation = DataOrganisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_organisation }
    end
  end

  # GET /data_organisations/1/edit
  def edit

    @questions = Question.find(:all, :order => :id, :conditions => { :question_type => 3 } )

    @data_organisation = @response.data_organisations.find(params[:id])
    # was @data_organisation = DataOrganisation.find(params[:id])
  end

  # POST /data_organisations
  # POST /data_organisations.xml
  def create
    # do this for each question
	@questions = Question.find(:all, :conditions => { :question_type => 3 } )
		@questions.each do |question|


		    @data_organisation = @response.data_organisations.build(params["#{question.id}"])
		    # @data_organisation = DataOrganisation.new(params[:data_organisation])

		      if @data_organisation.save
			@awesome = "yes"
		      end
		end
		
		    respond_to do |format|
		      if @awesome == "yes"
			flash[:notice] = 'DataOrganisation was successfully created.'
			format.html { redirect_to(response_data_organisations_path(@response)) }
			format.xml  { render :xml => @data_organisation, :status => :created, :location => @data_organisation }
		      else
			format.html { render :action => "new" }
			format.xml  { render :xml => @data_organisation.errors, :status => :unprocessable_entity }
		      end
		    end
  end

  # PUT /data_organisations/1
  # PUT /data_organisations/1.xml
  def update
    @data_organisation = @response.data_organisations.find(params[:id])
    # @data_organisation = DataOrganisation.find(params[:id])

    respond_to do |format|
      if @data_organisation.update_attributes(params[:data_organisation])
        flash[:notice] = 'DataOrganisation was successfully updated.'
        format.html { redirect_to(@data_organisation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_organisation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_organisations/1
  # DELETE /data_organisations/1.xml
  def destroy
     @data_organisation = @response.data_organisations.find(params[:id])
#    @data_organisation = DataOrganisation.find(params[:id])
    @data_organisation.destroy

    respond_to do |format|
      format.html { redirect_to(data_organisations_url) }
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
