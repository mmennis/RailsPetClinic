class SpecialtiesController < ApplicationController
  # GET /specialties
  # GET /specialties.xml
  def index
    @specialties = Specialty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @specialties }
    end
  end

  # GET /specialties/1
  # GET /specialties/1.xml
  def show
    @specialty = Specialty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @specialty }
    end
  end

  # GET /specialties/new
  # GET /specialties/new.xml
  def new
    @specialty = Specialty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @specialty }
    end
  end

  # GET /specialties/1/edit
  def edit
    @specialty = Specialty.find(params[:id])
  end

  # POST /specialties
  # POST /specialties.xml
  def create
    @specialty = Specialty.new(params[:specialty])

    respond_to do |format|
      if @specialty.save
        format.html { redirect_to(@specialty, :notice => 'Specialty was successfully created.') }
        format.xml  { render :xml => @specialty, :status => :created, :location => @specialty }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @specialty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /specialties/1
  # PUT /specialties/1.xml
  def update
    @specialty = Specialty.find(params[:id])

    respond_to do |format|
      if @specialty.update_attributes(params[:specialty])
        format.html { redirect_to(@specialty, :notice => 'Specialty was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @specialty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /specialties/1
  # DELETE /specialties/1.xml
  def destroy
    @specialty = Specialty.find(params[:id])
    @specialty.destroy

    respond_to do |format|
      format.html { redirect_to(specialties_url) }
      format.xml  { head :ok }
    end
  end
end
