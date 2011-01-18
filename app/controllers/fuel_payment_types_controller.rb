class FuelPaymentTypesController < ApplicationController

  set_tab :admin
  set_tab :fuel, :adminmenu
  filter_resource_access

  # GET /fuel_payment_types
  # GET /fuel_payment_types.xml
  def index
    @fuel_payment_types = FuelPaymentType.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fuel_payment_types }
    end
  end

  # POST /fuel_payment_types
  # POST /fuel_payment_types.xml
  def create
    @fuel_payment_types = FuelPaymentType.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('name')
    @fuel_payment_type = FuelPaymentType.new(params[:fuel_payment_type])

    respond_to do |format|
      if @fuel_payment_type.save
        format.html { redirect_to(fuel_payment_types_url, :notice => 'Fuel Payment Type was successfully created.') }
        format.xml  { render :xml => @fuel_payment_type, :status => :created, :location => @fuel_payment_type }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @fuel_payment_type.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /fuel_payment_types/1
  # DELETE /fuel_payment_types/1.xml
  def destroy
    @fuel_payment_type = FuelPaymentType.find(params[:id])
    @fuel_payment_type.destroy

    respond_to do |format|
      format.html { redirect_to(fuel_payment_types_url, :notice => "Fuel Payment Type entry successfully deleted.") }
      format.xml  { head :ok }
    end
  end
end
