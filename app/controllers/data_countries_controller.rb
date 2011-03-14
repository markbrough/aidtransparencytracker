class DataCountriesController < ApplicationController
  # GET /data_countries
  # GET /data_countries.xml
  def index
    @data_countries = DataCountry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_countries }
    end
  end

  # GET /data_countries/1
  # GET /data_countries/1.xml
  def show
    @data_country = DataCountry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_country }
    end
  end

  # GET /data_countries/new
  # GET /data_countries/new.xml
  def new
    @data_country = DataCountry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_country }
    end
  end

  # GET /data_countries/1/edit
  def edit
    @data_country = DataCountry.find(params[:id])
  end

  # POST /data_countries
  # POST /data_countries.xml
  def create
    @data_country = DataCountry.new(params[:data_country])

    respond_to do |format|
      if @data_country.save
        flash[:notice] = 'DataCountry was successfully created.'
        format.html { redirect_to(@data_country) }
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
    @data_country = DataCountry.find(params[:id])

    respond_to do |format|
      if @data_country.update_attributes(params[:data_country])
        flash[:notice] = 'DataCountry was successfully updated.'
        format.html { redirect_to(@data_country) }
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
    @data_country = DataCountry.find(params[:id])
    @data_country.destroy

    respond_to do |format|
      format.html { redirect_to(data_countries_url) }
      format.xml  { head :ok }
    end
  end
end
