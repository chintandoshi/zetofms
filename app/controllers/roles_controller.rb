class RolesController < ApplicationController

  set_tab :admin
  set_tab :roles, :adminmenu
  filter_resource_access

  # GET /order_status_types
  # GET /order_status_types.xml
  def index
    @roles = Role.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # POST /order_status_types
  # POST /order_status_types.xml
  def create
    @roles = Role.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('name')
    @role= Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to(roles_url, :notice => 'New User role successfully added.') }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_status_types/1
  # DELETE /order_status_types/1.xml
  def destroy
    @role = Role.find_by_id(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url, :notice => "User role removed.") }
      format.xml  { head :ok }
    end
  end

end
