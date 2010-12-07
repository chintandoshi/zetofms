class OrderStatusTypesController < ApplicationController

  set_tab :admin
  
  # GET /order_status_types
  # GET /order_status_types.xml
  def index
    @order_status_types = OrderStatusType.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_status_types }
    end
  end

  # POST /order_status_types
  # POST /order_status_types.xml
  def create
    @order_status_type = OrderStatusType.new(params[:order_status_type])

    respond_to do |format|
      if @order_status_type.save
        format.html { redirect_to(order_status_types_url, :notice => 'Order Status Type was successfully added.') }
        format.xml  { render :xml => @order_status_type, :status => :created, :location => @order_status_type }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @order_status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_status_types/1
  # DELETE /order_status_types/1.xml
  def destroy
    @order_status_type = OrderStatusType.find_by_id(params[:id])
    @order_status_type.destroy

    respond_to do |format|
      format.html { redirect_to(order_status_types_url, :notice => "Order Status type removed.") }
      format.xml  { head :ok }
    end
  end
end
