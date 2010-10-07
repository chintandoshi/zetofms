class CustaccountsController < ApplicationController
  # GET /custaccounts
  # GET /custaccounts.xml

  set_tab :custaccounts

  def index

      @search = Custaccount.search(params[:search])

      if params[:search]
       @custaccounts = @search.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('company_name')
      else
        @custaccounts = Custaccount.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('company_name')
      end

  end

  # GET /custaccounts/1
  # GET /custaccounts/1.xml
  def show
    @custaccount = Custaccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @custaccount }
    end
  end

  # GET /custaccounts/new
  # GET /custaccounts/new.xml
  def new
    @custaccount = Custaccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @custaccount }
    end
  end

  # GET /custaccounts/1/edit
  def edit
    @custaccount = Custaccount.find(params[:id])
  end

  # POST /custaccounts
  # POST /custaccounts.xml
  def create
    @custaccount = Custaccount.new(params[:custaccount])

    respond_to do |format|
      if @custaccount.save
        format.html { redirect_to(@custaccount, :notice => 'Custaccount was successfully created.') }
        format.xml  { render :xml => @custaccount, :status => :created, :location => @custaccount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @custaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /custaccounts/1
  # PUT /custaccounts/1.xml
  def update
    @custaccount = Custaccount.find(params[:id])

    respond_to do |format|
      if @custaccount.update_attributes(params[:custaccount])
        format.html { redirect_to(@custaccount, :notice => 'Custaccount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @custaccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /custaccounts/1
  # DELETE /custaccounts/1.xml
  def destroy
    @custaccount = Custaccount.find(params[:id])
    @custaccount.destroy

    respond_to do |format|
      format.html { redirect_to(custaccounts_url) }
      format.xml  { head :ok }
    end
  end
end
