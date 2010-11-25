class ConsignorsController < ApplicationController
  # GET /consignors
  # GET /consignors.xml

  set_tab :contacts
  
  def index
      @search = Consignor.search(params[:search])

      if params[:search]
       @consignors = @search.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('consignor_name')
      else
        @consignors = Consignor.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('consignor_name')
      end
  end

  # GET /consignors/1
  # GET /consignors/1.xml
  def show
    @consignor = Consignor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consignor }
    end
  end

  # GET /consignors/new
  # GET /consignors/new.xml
  def new
    @consignor = Consignor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consignor }
    end
  end

  # GET /consignors/1/edit
  def edit
    @consignor = Consignor.find(params[:id])
  end

  # POST /consignors
  # POST /consignors.xml
  def create
    @consignor = Consignor.new(params[:consignor])

    respond_to do |format|
      if @consignor.save
        format.html { redirect_to(@consignor, :notice => 'Consignor was successfully created.') }
        format.xml  { render :xml => @consignor, :status => :created, :location => @consignor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consignor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consignors/1
  # PUT /consignors/1.xml
  def update
    @consignor = Consignor.find(params[:id])

    respond_to do |format|
      if @consignor.update_attributes(params[:consignor])
        format.html { redirect_to(@consignor, :notice => 'Consignor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consignor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consignors/1
  # DELETE /consignors/1.xml
  def destroy
    @consignor = Consignor.find(params[:id])
    @consignor.destroy

    respond_to do |format|
      format.html { redirect_to(consignors_url) }
      format.xml  { head :ok }
    end
  end

  def city_autocomplete
    @consignor = Consignor.find(params[:id])
    render :text => @consignor.city.upcase
  end
end
