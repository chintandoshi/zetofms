class FleetCardsController < ApplicationController

  filter_resource_access
  set_tab :fuel

  def index
      @search = FleetCard.search(params[:search])

      if params[:search]
       @fleet_cards = @search.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('name')
      else
        @fleet_cards = FleetCard.paginate :page => params[:page],
          :per_page => 15,
          :order => sort_order('name')
      end
  end

  # GET /fleet_cards/1
  # GET /fleet_cards/1.xml
  def show
    @fleet_card = FleetCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fleet_card }
    end
  end

  # GET /fleet_cards/new
  # GET /fleet_cards/new.xml
  def new
    @fleet_card = FleetCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fleet_card }
    end
  end

  # GET /fleet_cards/1/edit
  def edit
    @fleet_card = FleetCard.find(params[:id])
  end

  # POST /fleet_cards
  # POST /fleet_cards.xml
  def create
    @fleet_card = FleetCard.new(params[:fleet_card])

    respond_to do |format|
      if @fleet_card.save
        format.html { redirect_to(@fleet_card, :notice => 'Fleet Card was successfully added.') }
        format.xml  { render :xml => @fleet_card, :status => :created, :location => @fleet_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fleet_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fleet_cards/1
  # PUT /fleet_cards/1.xml
  def update
    @fleet_card = FleetCard.find(params[:id])

    respond_to do |format|
      if @fleet_card.update_attributes(params[:fleet_card])
        format.html { redirect_to(@fleet_card, :notice => 'Fleet Card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fleet_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fleet_cards/1
  # DELETE /fleet_cards/1.xml
  def destroy
    @fleet_card = FleetCard.find(params[:id])
    @fleet_card.destroy

    respond_to do |format|
      format.html { redirect_to(fleet_cards_url, :notice => "Fleet Card was deleted.") }
      format.xml  { head :ok }
    end
  end
end
