class DetentionsController < ApplicationController

  # GET /detentions/new
  # GET /detentions/new.xml
  set_tab :orders
  before_filter :find_order, :tab_selection
  filter_access_to :new, :edit, :create, :update, :destroy

  def tab_selection
     session[:selected_tab] = 4
  end

  def find_order
    @order = Order.find_by_id(params[:order_id])
  end

  def new
    @detention = @order.detentions.build()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @detention }
    end
  end

  # GET /detentions/1/edit
  def edit
    @detention = Detention.find(params[:id])
  end

  # POST /detentions
  # POST /detentions.xml
  def create
    @detention = @order.detentions.build(params[:detention])

    respond_to do |format|
      if @detention.save
        format.html { redirect_to(@order, :notice => 'Detention entry successfully added.') }
        format.xml  { render :xml => @detention, :status => :created, :location => @detention }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /detentions/1
  # PUT /detentions/1.xml
  def update
    @detention = Detention.find(params[:id])

    respond_to do |format|
      if @detention.update_attributes(params[:detention])
        format.html { redirect_to(@order, :notice => 'Detention entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @detention.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /detentions/1
  # DELETE /detentions/1.xml
  def destroy
    @detention = Detention.find(params[:id])
    @detention.destroy

    respond_to do |format|
      format.html { redirect_to(@order, :notice => "Detention Entry deleted.") }
      format.xml  { head :ok }
    end
  end
end
