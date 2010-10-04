class VehiclesController < ApplicationController

  set_tab :vehicles

  # GET /vehicles
  # GET /vehicles.xml
  def index
      @search = Vehicle.search(params[:search])

      if params[:search]
       @vehicles = @search.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('registration_number')
      else
        @vehicles = Vehicle.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('registration_number')
      end
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
    @vehicle = Vehicle.find(params[:id])
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
    @vehicle = Vehicle.find(params[:id])

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
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to(vehicles_url) }
      format.xml  { head :ok }
    end
  end


  def attachments
    @vehicle = Vehicle.find(params[:id])
  end

  def add_attachment
      @attachment = AttachmentBox.new(params[:attachment_box])
      @vehicle = Vehicle.find(params[:id])

      if (!@attachment.valid?)
        render :action => "attachments"
        return
      end

    @attachment.username = current_user_session.record.login
    @vehicle.attachment_boxes << @attachment

      if @vehicle.save!
          redirect_to(attachments_vehicle_path(@vehicle), :notice => 'Uploaded successfully.')
      end

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
