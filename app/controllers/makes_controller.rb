class MakesController < ApplicationController
  # GET /makes
  # GET /makes.xml

  set_tab :admin
  filter_resource_access

  def index

    @makes = Make.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('make_name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @makes }
    end
  end

  def show
    @make = Make.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @driver }
    end
  end

  # POST /makes
  # POST /makes.xml
  def create
    @make = Make.new(params[:make])

    @makes = Make.paginate :page => params[:page],
        :per_page => 5,
        :order => sort_order('make_name')

    respond_to do |format|
      if @make.save
        format.html { redirect_to(makes_url, :notice => 'Vehicle Make was successfully added.') }
        format.xml  { render :xml => @make, :status => :created, :location => @make }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @make.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /makes/1
  # DELETE /makes/1.xml
  def destroy
    @make = Make.find(params[:id])
    
    begin
      @make.destroy
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to(makes_url, :notice => "Cant delete #{@make.make_name} with #{@make.vmodels.count} associated models")
      return
    end
    
    respond_to do |format|
      format.html { redirect_to(makes_url, :notice => "Vehicle manufacturer was successfully deleted") }
      format.xml  { head :ok }
    end
  end
end
