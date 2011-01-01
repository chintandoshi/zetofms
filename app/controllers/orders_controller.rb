class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  set_tab :orders
  before_filter :set_search_object
  filter_access_to :index, :show, :new, :create, :edit, :update, :destroy, :lock, :close
  
  def set_search_object
    @search = Order.search(params[:search])
  end

  def index
    
    session[:selected_tab] = 0 #Reset tab index

    if params[:search]
        @orders = @search.paginate :page => params[:page],
          :per_page => 10,
          :order => params[:order_by] || 'orders.current_status_id DESC'
    else
        @orders = Order.paginate :page => params[:page],
          :per_page => 10,
          :order => params[:order_by] || 'orders.current_status_id DESC'
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

    @disabled_tabs = tabs_to_disable(@order)
    session[:selected_tab] = 0 if !defined?(session[:selected_tab])

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
    session[:selected_tab] = 0 #Reset tab index

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
    session[:selected_tab] = 0 #Reset tab index

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
      format.html { redirect_to(@order, :notice => "Order cancelled") }
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

  def close
    @order = Order.find(params[:id])
    @order.closed = true
    @order.closed_by = current_user_session.record.login
    @order.closed_at = DateTime.now
    @order.save

    redirect_to(@order, :notice => 'Order successfully locked')
  end

  def tooltip
    @order = Order.find(params[:id])
    render :partial => "tooltip", :layout => false
  end

  private
   def tabs_to_disable(order)
        disabled_tabs = []
        if !order.planning_enabled?
          disabled_tabs << 1
        end
        if !order.loading_enabled?
          disabled_tabs << 2
        end
        if !order.delivery_enabled?
          disabled_tabs << 3
        end
        if !order.detention_enabled?
          disabled_tabs << 4
        end
        if !order.billing_enabled?
          disabled_tabs << 5
        end

        return disabled_tabs
   end
end
