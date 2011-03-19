class DataCountriesController < ApplicationController

  before_filter :get_response
  # get_response is defined at the bottom of the file
  # and takes the response_id given by the routing and
  # converts it to an @response object.

  # GET /data_countries
  # GET /data_countries.xml
  def index
    @questions = Question.find(:all, :order => :id, :conditions => { :question_type => 2 } )
  @data_countries = @response.data_countries
# was    @data_countries = DataCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_countries }
    end
  end

  # GET /data_countries/1
  # GET /data_countries/1.xml
  def show
@data_country = @response.data_countries.find(params[:id])
#    @data_country = DataCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_country }
    end
  end

  # GET /data_countries/new
  # GET /data_countries/new.xml
  def new
    @questions = Question.find(:all, :order => :id, :conditions => { :question_type => 2 } )
@data_country = @response.data_countries.build
# was    @data_country = DataCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_country }
    end
  end

  # GET /data_countries/1/edit
  def edit
    @questions = Question.find(:all, :order => :id, :conditions => { :question_type => 2 } )
	@data_countries = @response.data_countries.find(params[:id])
# was    @data_country = DataCountry.find(params[:id])
  end

  # POST /data_countries
  # POST /data_countries.xml

  def create
	# do this for each question
	@questions = Question.find(:all, :conditions => { :question_type => 2 } )
	@questions.each do |question|

	    @data_country_params = @response.data_countries.build(params["#{question.id}"])
	    @data_country_params[:entry_date] = Date.today
	    @data_country = DataCountry.new(@data_country_params)
	    
	      if @data_country.save
		@awesome = "yes"
	      end
	    
	    end
	     respond_to do |format|
	      if @awesome == "yes"
		flash[:notice] = 'Country level questions were successfully created.'
		format.html { redirect_to(response_data_countries_path(@response)) }
		format.xml  { render :xml => @data_country, :status => :created, :location => @data_country }
	      else
		format.html { render :action => "new" }
		format.xml  { render :xml => @data_country.errors, :status => :unprocessable_entity }
	      end
	end

end

  # PUT /data_countries/1
  # PUT /data_countries/1.xml
  def update
@data_country = @response.data_countries.find(params[:id])
# was    @data_country = DataCountry.find(params[:id])

    respond_to do |format|
      if @data_country.update_attributes(params[:data_country])
        flash[:notice] = 'DataCountry was successfully updated.'
        format.html { redirect_to([@response, @data_country]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @data_country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_countries/1
  # DELETE /data_countries/1.xml
  def destroy
@data_country = @response.data_countries.find(params[:id])
# was    @data_country = DataCountry.find(params[:id])
    @data_country.destroy

    respond_to do |format|
      format.html { redirect_to(response_data_countries_path(@response)) }
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
