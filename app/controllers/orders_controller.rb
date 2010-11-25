class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  set_tab :orders

  def index
    @search = Order.search(params[:search])

    if params[:search]
        @orders = @search.paginate :page => params[:page],
          :per_page => 5,
          :order => sort_order('id')
    else
        @orders = Order.paginate :page => params[:page],
          :per_page => 5,
          :order => sort_order('id')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to(@order, :notice => 'Order was successfully added.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.cancelled = true
    @order.cancelled_at = DateTime.now
    @order.cancelled_by = current_user_session.record.login
    @order.save

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  def lock
    @order = Order.find(params[:id])
    @order.approved = true
    @order.approved_by = current_user_session.record.login
    @order.approved_at = DateTime.now
    @order.save

    redirect_to(@order, :notice => 'Placement details successfully locked.')

  end

end
