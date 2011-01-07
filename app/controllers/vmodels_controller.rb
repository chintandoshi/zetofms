class VmodelsController < ApplicationController

  set_tab :admin
  filter_resource_access

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
    vm = Vmodel.find(params[:id])
    make_id = vm.make_id

    begin
      vm.destroy
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to(make_url(make_id), :notice => "Unable to delete #{vm.model_name} as it has 1 or more vehicle(s) associated. " )
      return
    end

    respond_to do |format|
      format.html { redirect_to(make_url(make_id), :notice => "Vehicle model was successfully deleted.") }
      format.xml  { head :ok }
    end
  end
  
end
