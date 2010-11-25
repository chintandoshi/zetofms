class DeliveredOrdersController < ApplicationController

  set_tab :orders
  before_filter :find_order

  def find_order
      @order = Order.find_by_id(params[:order_id])
  end

  # GET /delivered_orders/new
  # GET /delivered_orders/new.xml
  def new
    @delivered_order = @order.build_delivered_order()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @delivered_order }
    end
  end

  # GET /delivered_orders/1/edit
  def edit
    @delivered_order = @order.delivered_order()
  end

  # POST /delivered_orders
  # POST /delivered_orders.xml
  def create
    @delivered_order = @order.build_delivered_order(params[:delivered_order])

    respond_to do |format|
      if @delivered_order.save
        format.html { redirect_to(@order, :notice => 'Delivery details was successfully added.') }
        format.xml  { render :xml => @delivered_order, :status => :created, :location => @delivered_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @delivered_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /delivered_orders/1
  # PUT /delivered_orders/1.xml
  def update
    @delivered_order = @order.delivered_order

    respond_to do |format|
      if @delivered_order.update_attributes(params[:delivered_order])
        format.html { redirect_to(@order, :notice => 'Delivery details successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivered_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def lock
    @delivered_order = @order.delivered_order
    @delivered_order.approved = true
    @delivered_order.approved_by = current_user_session.record.login
    @delivered_order.approved_at = DateTime.now
    @delivered_order.save

    redirect_to(@order, :notice => 'Delivery details successfully locked.')
  end
end
