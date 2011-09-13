class PetTypesController < ApplicationController
  # GET /pet_types
  # GET /pet_types.xml
  def index
    @pet_types = PetType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pet_types }
    end
  end

  # GET /pet_types/1
  # GET /pet_types/1.xml
  def show
    @pet_type = PetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pet_type }
    end
  end

  # GET /pet_types/new
  # GET /pet_types/new.xml
  def new
    @pet_type = PetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pet_type }
    end
  end

  # GET /pet_types/1/edit
  def edit
    @pet_type = PetType.find(params[:id])
  end

  # POST /pet_types
  # POST /pet_types.xml
  def create
    @pet_type = PetType.new(params[:pet_type])

    respond_to do |format|
      if @pet_type.save
        format.html { redirect_to(@pet_type, :notice => 'Pet type was successfully created.') }
        format.xml  { render :xml => @pet_type, :status => :created, :location => @pet_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pet_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pet_types/1
  # PUT /pet_types/1.xml
  def update
    @pet_type = PetType.find(params[:id])

    respond_to do |format|
      if @pet_type.update_attributes(params[:pet_type])
        format.html { redirect_to(@pet_type, :notice => 'Pet type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pet_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_types/1
  # DELETE /pet_types/1.xml
  def destroy
    @pet_type = PetType.find(params[:id])
    @pet_type.destroy

    respond_to do |format|
      format.html { redirect_to(pet_types_url) }
      format.xml  { head :ok }
    end
  end
end
