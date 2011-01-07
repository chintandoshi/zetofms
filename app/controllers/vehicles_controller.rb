class VehiclesController < ApplicationController

  set_tab :vehicles
  filter_resource_access :additional_collection => [:retired]

  # GET /vehicles
  # GET /vehicles.xml
  def index
      @search = Vehicle.active.search(params[:search])

      if params[:search]
       @vehicles = @search.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('registration_number')
      else
        @vehicles = Vehicle.active.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('registration_number')
      end

  end

  # GET /vehicles/retired
  def retired

        @vehicles = Vehicle.retired.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('registration_number')

  end

  # GET /vehicles/1
  # GET /vehicles/1.xml
  def show
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.xml
  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.active.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.xml
  def create
    @vehicle = Vehicle.new(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        update_products(@vehicle)
        format.html { redirect_to(@vehicle, :notice => 'Vehicle was successfully added.') }
        format.xml  { render :xml => @vehicle, :status => :created, :location => @vehicle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.xml
  def update
    @vehicle = Vehicle.active.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        update_products(@vehicle)
        format.html { redirect_to(@vehicle, :notice => 'Vehicle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.xml
  def destroy
    @vehicle = Vehicle.find(params[:id])

    begin
      @vehicle.destroy
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to( @vehicle, :notice => e.message)
      return
    end

    respond_to do |format|
      format.html { redirect_to(vehicles_url, :notice => "Vehicle deleted.") }
      format.xml  { head :ok }
    end
  end

  # PUT /vehicles/12/toggle
  def retire
    vehicle = Vehicle.active.find(params[:id])

    if vehicle.retired_at.nil?
      vehicle.update_attribute(:retired_at, DateTime.now)
    end

    redirect_to(vehicles_url, :notice => "Vehicle #{vehicle.registration_number} retired.")
  end

  private

  def update_products(vehicle)
    # delete existing associations
    vehicle.product_types.delete_all

    #build an array of product objects from product ids posted by browser
    selected_products = vehicle.product_list.nil? ? [] : vehicle.product_list.keys.collect{|id| ProductType.find_by_id(id)}
    #add each of them
    selected_products.each { |product| vehicle.product_types << product}
    
  end


end
