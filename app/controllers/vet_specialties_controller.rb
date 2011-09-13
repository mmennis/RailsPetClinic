class VetSpecialtiesController < ApplicationController
  # GET /vet_specialties
  # GET /vet_specialties.xml
  def index
    @vet_specialties = VetSpecialty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vet_specialties }
    end
  end

  # GET /vet_specialties/1
  # GET /vet_specialties/1.xml
  def show
    @vet_specialty = VetSpecialty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vet_specialty }
    end
  end

  # GET /vet_specialties/new
  # GET /vet_specialties/new.xml
  def new
    @vet_specialty = VetSpecialty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vet_specialty }
    end
  end

  # GET /vet_specialties/1/edit
  def edit
    @vet_specialty = VetSpecialty.find(params[:id])
  end

  # POST /vet_specialties
  # POST /vet_specialties.xml
  def create
    @vet_specialty = VetSpecialty.new(params[:vet_specialty])

    respond_to do |format|
      if @vet_specialty.save
        format.html { redirect_to(@vet_specialty, :notice => 'Vet specialty was successfully created.') }
        format.xml  { render :xml => @vet_specialty, :status => :created, :location => @vet_specialty }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vet_specialty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vet_specialties/1
  # PUT /vet_specialties/1.xml
  def update
    @vet_specialty = VetSpecialty.find(params[:id])

    respond_to do |format|
      if @vet_specialty.update_attributes(params[:vet_specialty])
        format.html { redirect_to(@vet_specialty, :notice => 'Vet specialty was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vet_specialty.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vet_specialties/1
  # DELETE /vet_specialties/1.xml
  def destroy
    @vet_specialty = VetSpecialty.find(params[:id])
    @vet_specialty.destroy

    respond_to do |format|
      format.html { redirect_to(vet_specialties_url) }
      format.xml  { head :ok }
    end
  end
end
