class ProductTypesController < ApplicationController

  set_tab :admin
  filter_resource_access
  
  # GET /product_types
  # GET /product_types.xml
  def index
    @product_types = ProductType.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('product_type_name')


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_types }
    end
  end

  # POST /product_types
  # POST /product_types.xml
  def create
    @product_type = ProductType.new(params[:product_type])
    @product_types = ProductType.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('product_type_name')

    respond_to do |format|
      if @product_type.save
        format.html { redirect_to(product_types_url, :notice => 'Product Type was successfully added.') }
        format.xml  { render :xml => @product_type, :status => :created, :location => @product_type }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @product_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.xml
  def destroy
    @product_type = ProductType.find(params[:id])

    begin
      @product_type.destroy
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to(product_types_url, :notice => e.message)
      return
    end

    respond_to do |format|
      format.html { redirect_to(product_types_url, :notice => 'Product Type was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
