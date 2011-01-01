class ProductUnitsController < ApplicationController

  set_tab :admin
  filter_resource_access


 # GET /product_types
  # GET /product_types.xml
  def index
    @product_units = ProductUnit.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('product_unit_name')


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_units }
    end
  end

  # POST /product_types
  # POST /product_types.xml
  def create
    @product_unit = ProductUnit.new(params[:product_unit])
    @product_units = ProductUnit.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('product_unit_name')

    respond_to do |format|
      if @product_unit.save
        format.html { redirect_to(product_units_url, :notice => 'Product Unit was successfully added.') }
        format.xml  { render :xml => @product_unit, :status => :created, :location => @product_unit }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @product_unit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.xml
  def destroy
    @product_unit = ProductUnit.find(params[:id])
    @product_unit.destroy

    respond_to do |format|
      format.html { redirect_to(product_units_url, :notice => 'Product Unit was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
