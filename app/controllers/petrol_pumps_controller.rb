class PetrolPumpsController < ApplicationController
  # GET /petrol_pumps
  # GET /petrol_pumps.xml

  filter_resource_access
  set_tab :fuel

  def index
      @search = PetrolPump.search(params[:search])

      if params[:search]
       @petrol_pumps = @search.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('name')
      else
        @petrol_pumps = PetrolPump.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('name')
      end
  end

  # GET /petrol_pumps/1
  # GET /petrol_pumps/1.xml
  def show
    @petrol_pump = PetrolPump.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @petrol_pump }
    end
  end

  # GET /petrol_pumps/new
  # GET /petrol_pumps/new.xml
  def new
    @petrol_pump = PetrolPump.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @petrol_pump }
    end
  end

  # GET /petrol_pumps/1/edit
  def edit
    @petrol_pump = PetrolPump.find(params[:id])
  end

  # POST /petrol_pumps
  # POST /petrol_pumps.xml
  def create
    @petrol_pump = PetrolPump.new(params[:petrol_pump])

    respond_to do |format|
      if @petrol_pump.save
        format.html { redirect_to(@petrol_pump, :notice => 'Petrol Pump entry was successfully added.') }
        format.xml  { render :xml => @petrol_pump, :status => :created, :location => @petrol_pump }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @petrol_pump.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /petrol_pumps/1
  # PUT /petrol_pumps/1.xml
  def update
    @petrol_pump = PetrolPump.find(params[:id])

    respond_to do |format|
      if @petrol_pump.update_attributes(params[:petrol_pump])
        format.html { redirect_to(@petrol_pump, :notice => 'Petrol Pump entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @petrol_pump.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /petrol_pumps/1
  # DELETE /petrol_pumps/1.xml
  def destroy
    @petrol_pump = PetrolPump.find(params[:id])
    @petrol_pump.destroy

    respond_to do |format|
      format.html { redirect_to(petrol_pumps_url, :notice => "Petrol Pump entry deleted.") }
      format.xml  { head :ok }
    end
  end
end
