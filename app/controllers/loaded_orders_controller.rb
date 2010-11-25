class LoadedOrdersController < ApplicationController
  # GET /loaded_orders
  # GET /loaded_orders.xml
  set_tab :orders
  before_filter :find_order

  def find_order
      @order = Order.find_by_id(params[:order_id])
  end

  # GET /loaded_orders/new
  # GET /loaded_orders/new.xml
  def new
    @loaded_order = @order.build_loaded_order()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loaded_order }
    end
  end

  # GET /loaded_orders/1/edit
  def edit
    @loaded_order = @order.loaded_order
  end

  # POST /loaded_orders
  # POST /loaded_orders.xml
  def create
    @loaded_order = @order.build_loaded_order(params[:loaded_order])

    respond_to do |format|
      if @loaded_order.save
        format.html { redirect_to(@order, :notice => 'Loading details successfully added.') }
        format.xml  { render :xml => @loaded_order, :status => :created, :location => @loaded_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loaded_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loaded_orders/1
  # PUT /loaded_orders/1.xml
  def update
    @loaded_order = @order.loaded_order

    respond_to do |format|
      if @loaded_order.update_attributes(params[:loaded_order])
        format.html { redirect_to(@order, :notice => 'Loading details successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loaded_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def lock
    @loaded_order = @order.loaded_order
    @loaded_order.approved = true
    @loaded_order.approved_by = current_user_session.record.login
    @loaded_order.approved_at = DateTime.now
    @loaded_order.save

    redirect_to(@order, :notice => 'Loading details successfully locked.')
  end
end
