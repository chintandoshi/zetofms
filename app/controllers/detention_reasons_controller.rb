class DetentionReasonsController < ApplicationController

  set_tab :admin
  filter_resource_access


  # GET /detention_reasons
  # GET /detention_reasons.xml
  def index
    @detention_reasons = DetentionReason.paginate :page => params[:page],
      :per_page => 5,
      :order => sort_order('description')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @detention_reasons }
    end
  end

  # POST /detention_reasons
  # POST /detention_reasons.xml
  def create
    @detention_reason = DetentionReason.new(params[:detention_reason])

    respond_to do |format|
      if @detention_reason.save
        format.html { redirect_to(detention_reasons_url, :notice => 'New Detention Reason was successfully added.') }
        format.xml  { render :xml => @detention_reason, :status => :created, :location => @detention_reason }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @detention_reason.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /detention_reasons/1
  # DELETE /detention_reasons/1.xml
  def destroy
    @detention_reason = DetentionReason.find(params[:id])
    @detention_reason.destroy

    respond_to do |format|
      format.html { redirect_to(detention_reasons_url,:notice => 'Detention Reason was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
end
