class BilledOrdersController < ApplicationController
  # GET /billed_orders
  # GET /billed_orders.xml
  set_tab :orders
  before_filter :find_order, :tab_selection

  def find_order
      @order = Order.find_by_id(params[:order_id])
  end

  def tab_selection
     session[:selected_tab] = 5
  end

  # GET /billed_orders/new
  # GET /billed_orders/new.xml
  def new
    @billed_order = @order.build_billed_order()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @billed_order }
    end
  end

  # GET /billed_orders/1/edit
  def edit
    @billed_order = @order.billed_order
  end

  # POST /billed_orders
  # POST /billed_orders.xml
  def create
    @billed_order = @order.build_billed_order(params[:billed_order])

    respond_to do |format|
      if @billed_order.save
        format.html { redirect_to(@order, :notice => 'Billing details successfully added.') }
        format.xml  { render :xml => @billed_order, :status => :created, :location => @billed_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @billed_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /billed_orders/1
  # PUT /billed_orders/1.xml
  def update
    @billed_order = @order.billed_order

    respond_to do |format|
      if @billed_order.update_attributes(params[:billed_order])
        format.html { redirect_to(@order, :notice => 'Billing details successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @billed_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def lock
    @billed_order = @order.billed_order
    @billed_order.approved = true
    @billed_order.approved_by = current_user_session.record.login
    @billed_order.approved_at = DateTime.now
    @billed_order.save

    redirect_to(@order, :notice => 'Billing details successfully locked.')
  end
end
