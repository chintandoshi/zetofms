class VmodelsController < ApplicationController

  set_tab :admin

  # POST /vmodels
  # POST /vmodels.xml
  def create
    @make = Make.find(params[:make_id])
    @vmodel = @make.vmodels.build(params[:vmodel])

    respond_to do |format|
      if @vmodel.save
        format.html { redirect_to(@make, :notice => 'Vehicle model was successfully added.') }
        format.xml  { render :xml => @vmodel, :status => :created, :location => @vmodel }
      else
        format.html { redirect_to(@make) }
        format.xml  { render :xml => @vmodel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vmodels/1
  # DELETE /vmodels/1.xml
  def destroy
    vmodel = Vmodel.find(params[:id])
    make_id = vmodel.make_id
    vmodel.destroy

    respond_to do |format|
      format.html { redirect_to(make_url(make_id), :notice => "Vehicle model was successfully deleted.") }
      format.xml  { head :ok }
    end
  end
  
end
