class DerekslistsController < ApplicationController
  # GET /derekslists
  # GET /derekslists.xml
  def index
    @derekslists = Derekslist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @derekslists }
    end
  end

  # GET /derekslists/1
  # GET /derekslists/1.xml
  def show
    @derekslist = Derekslist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @derekslist }
    end
  end

  # GET /derekslists/new
  # GET /derekslists/new.xml
  def new
		@photos = Instagram::popular
    @derekslist = Derekslist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @derekslist }
    end
  end

  # GET /derekslists/1/edit
  def edit
    @derekslist = Derekslist.find(params[:id])
  end

  # POST /derekslists
  # POST /derekslists.xml
  def create
    @derekslist = Derekslist.new(params[:derekslist])

    respond_to do |format|
      if @derekslist.save
        format.html { redirect_to(@derekslist, :notice => 'Derekslist was successfully created.') }
        format.xml  { render :xml => @derekslist, :status => :created, :location => @derekslist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @derekslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /derekslists/1
  # PUT /derekslists/1.xml
  def update
    @derekslist = Derekslist.find(params[:id])

    respond_to do |format|
      if @derekslist.update_attributes(params[:derekslist])
        format.html { redirect_to(@derekslist, :notice => 'Derekslist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @derekslist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /derekslists/1
  # DELETE /derekslists/1.xml
  def destroy
    @derekslist = Derekslist.find(params[:id])
    @derekslist.destroy

    respond_to do |format|
      format.html { redirect_to(derekslists_url) }
      format.xml  { head :ok }
    end
  end
end
