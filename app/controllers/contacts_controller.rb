class ContactsController < ApplicationController

  # GET /contacts/new
  # GET /contacts/new.xml
  before_filter :find_resource
  set_tab :contacts

  def index
    @no_of_customers = Custaccount.count
    @no_of_consignors = Consignor.count
    @no_of_consignees = Consignee.count
  end

  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact =  @resource.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to(@resource, :notice => 'Contact was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])
    
    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to(@resource, :notice => 'Contact was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(@resource, :notice => 'Contact was successfully deleted') }
    end
  end

  def find_resource
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @resource = $1.classify.constantize.find(value)
        return
      end
    end
    @resource = nil
  end

  def update_contacts_autocomplete
    
    @contacts = Custaccount.find_by_id(params[:id]).contacts
    render :partial => "update_contacts_autocomplete"
  end

end
