class PlannedOrdersController < ApplicationController

  set_tab :orders
  before_filter :find_order, :tab_selection

  def find_order
      @order = Order.find_by_id(params[:order_id])
  end

  def tab_selection
     session[:selected_tab] = 1
  end

  # GET /planned_orders/new
  # GET /planned_orders/new.xml
  def new

    @planned_order = @order.build_planned_order()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @planned_order }
    end
  end

  # GET /planned_orders/1/edit
  def edit
    @planned_order = @order.planned_order
  end

  # POST /planned_orders
  # POST /planned_orders.xml
  def create
    @planned_order = @order.build_planned_order(params[:planned_order])

    respond_to do |format|
      if @planned_order.save
        format.html { redirect_to(@order, :notice => 'Order Planning successfully added.') }
        format.xml  { render :xml => @planned_order, :status => :created, :location => @planned_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @planned_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /planned_orders/1
  # PUT /planned_orders/1.xml
  def update
    @planned_order = @order.planned_order

    respond_to do |format|
      if @planned_order.update_attributes(params[:planned_order])
        format.html { redirect_to(@order, :notice => 'Order Planning successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @planned_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def lock
    @planned_order = @order.planned_order
    @planned_order.approved = true
    @planned_order.approved_by = current_user_session.record.login
    @planned_order.approved_at = DateTime.now
    @planned_order.save

    redirect_to(@order, :notice => 'Planning details successfully locked.')
  end
end
