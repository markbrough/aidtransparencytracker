class DataOrganisationsController < ApplicationController
  # GET /data_organisations
  # GET /data_organisations.xml
  def index
    @data_organisations = DataOrganisation.all

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
    @data_organisation = DataOrganisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @data_organisation }
    end
  end

  # GET /data_organisations/1/edit
  def edit
    @data_organisation = DataOrganisation.find(params[:id])
  end

  # POST /data_organisations
  # POST /data_organisations.xml
  def create
    @data_organisation = DataOrganisation.new(params[:data_organisation])

    respond_to do |format|
      if @data_organisation.save
        flash[:notice] = 'DataOrganisation was successfully created.'
        format.html { redirect_to(@data_organisation) }
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
    @data_organisation = DataOrganisation.find(params[:id])

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
    @data_organisation = DataOrganisation.find(params[:id])
    @data_organisation.destroy

    respond_to do |format|
      format.html { redirect_to(data_organisations_url) }
      format.xml  { head :ok }
    end
  end
end
