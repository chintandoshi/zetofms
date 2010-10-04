class DriversController < ApplicationController
  # GET /drivers
  # GET /drivers.xml
  
  set_tab :drivers

  def index
      @search = Driver.search(params[:search])

      if params[:search]
       @drivers = @search.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('first_name')
      else
        @drivers = Driver.paginate :page => params[:page],
          :per_page => 4,
          :order => sort_order('first_name')
      end
  end

  # GET /drivers/1
  # GET /drivers/1.xml
  def show
    @driver = Driver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @driver }
    end
  end

  # GET /drivers/new
  # GET /drivers/new.xml
  def new
    @driver = Driver.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @driver }
    end
  end

  # GET /drivers/1/edit
  def edit
    @driver = Driver.find(params[:id])
  end

  # POST /drivers
  # POST /drivers.xml
  def create
    @driver = Driver.new(params[:driver])

    respond_to do |format|
      if @driver.save
        format.html { redirect_to(@driver, :notice => 'Driver was successfully created.') }
        format.xml  { render :xml => @driver, :status => :created, :location => @driver }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @driver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.xml
  def update
    @driver = Driver.find(params[:id])

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        format.html { redirect_to(@driver, :notice => 'Driver was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @driver.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.xml
  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to(drivers_url) }
      format.xml  { head :ok }
    end
  end

  def attachments
    @driver = Driver.find(params[:id])
  end

  def add_attachment
      @attachment = AttachmentBox.new(params[:attachment_box])
      @driver = Driver.find(params[:id])

      if (!@attachment.valid?)
        render :action => "attachments"
        return
      end

    @attachment.username = current_user_session.record.login
    @driver.attachment_boxes << @attachment
    
      if @driver.save!
          redirect_to(attachments_driver_path(@driver), :notice => 'Uploaded successfully.')
      end

    end

end
