class OwnersController < ApplicationController
  # GET /owners
  # GET /owners.xml
  def index
    @owners = Owner.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @owners }
    end
  end

  # GET /owners/1
  # GET /owners/1.xml
  def show
    @owner = Owner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @owner }
    end
  end

  # GET /owners/new
  # GET /owners/new.xml
  def new
    @owner = Owner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @owner }
    end
  end

  # GET /owners/1/edit
  def edit
    @owner = Owner.find(params[:id])
  end

  # POST /owners
  # POST /owners.xml
  def create
    @owner = Owner.new(params[:owner])

    respond_to do |format|
      if @owner.save
        format.html { redirect_to(@owner, :notice => 'Owner was successfully created.') }
        format.xml  { render :xml => @owner, :status => :created, :location => @owner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /owners/1
  # PUT /owners/1.xml
  def update
    @owner = Owner.find(params[:id])

    respond_to do |format|
      if @owner.update_attributes(params[:owner])
        format.html { redirect_to(@owner, :notice => 'Owner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @owner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.xml
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to(owners_url) }
      format.xml  { head :ok }
    end
  end
end
