class CustcontactsController < ApplicationController

  set_tab :custaccounts
  before_filter :find_custaccount

  # GET /custcontacts/new
  # GET /custcontacts/new.xml
  def new
    @custcontact = Custcontact.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @custcontact }
    end
  end

  # GET /custcontacts/1/edit
  def edit
    @custcontact = Custcontact.find(params[:id])
  end

  # POST /custcontacts
  # POST /custcontacts.xml
  def create
    @custcontact = @custaccount.custcontacts.build(params[:custcontact])

    respond_to do |format|
      if @custcontact.save
        format.html { redirect_to(@custaccount, :notice => 'Customer contact was successfully added.') }
        format.xml  { render :xml => @custaccount, :status => :created, :location => @custcontact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @custcontact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /custcontacts/1
  # PUT /custcontacts/1.xml
  def update
    @custcontact = Custcontact.find(params[:id])

    respond_to do |format|
      if @custcontact.update_attributes(params[:custcontact])
        format.html { redirect_to(@custaccount, :notice => 'Customer contact info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @custcontact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /custcontacts/1
  # DELETE /custcontacts/1.xml
  def destroy
    @custcontact = Custcontact.find(params[:id])
    @custcontact.destroy

    respond_to do |format|
      format.html { redirect_to(@custaccount, :notice => 'Customer contact info was successfully deleted.') }
      format.xml  { head :ok }
    end
  end

  private

  def find_custaccount
    @custaccount_id = params[:custaccount_id]
    return(redirect_to(custaccounts_url)) unless @custaccount_id
    @custaccount = Custaccount.find(@custaccount_id)
  end

end
