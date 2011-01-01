class ConsigneesController < ApplicationController
  # GET /consignees
  # GET /consignees.xml

  set_tab :contacts
  filter_access_to :index, :show, :new, :edit, :create, :update, :destroy

  def index
      @search = Consignee.search(params[:search])

      if params[:search]
       @consignees = @search.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('consignee_name')
      else
        @consignees = Consignee.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('consignee_name')
      end
  end

  # GET /consignees/1
  # GET /consignees/1.xml
  def show
    @consignee = Consignee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consignee }
    end
  end

  # GET /consignees/new
  # GET /consignees/new.xml
  def new
    @consignee = Consignee.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consignee }
    end
  end

  # GET /consignees/1/edit
  def edit
    @consignee = Consignee.find(params[:id])
  end

  # POST /consignees
  # POST /consignees.xml
  def create
    @consignee = Consignee.new(params[:consignee])

    respond_to do |format|
      if @consignee.save
        format.html { redirect_to(@consignee, :notice => 'Consignee was successfully created.') }
        format.xml  { render :xml => @consignee, :status => :created, :location => @consignee }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consignees/1
  # PUT /consignees/1.xml
  def update
    @consignee = Consignee.find(params[:id])

    respond_to do |format|
      if @consignee.update_attributes(params[:consignee])
        format.html { redirect_to(@consignee, :notice => 'Consignee was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consignee.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consignees/1
  # DELETE /consignees/1.xml
  def destroy
    @consignee = Consignee.find(params[:id])
    @consignee.destroy

    respond_to do |format|
      format.html { redirect_to(consignees_url) }
      format.xml  { head :ok }
    end
  end

  def city_autocomplete
    @consignee = Consignee.find(params[:id])
    render :text => @consignee.city.upcase
  end
end
