class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [ :edit, :update, :destroy, :privileges_edit, :privileges_update]

  set_tab :admin, :only => [:index, :privileges_edit, :privileges_update, :remove]
  set_tab :user, :adminmenu, :only => [:index, :privileges_edit, :privileges_update, :remove]
  filter_access_to :index, :privileges_edit, :privileges_update, :remove

  def new
    @user = User.new
    render :layout => "user"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User registered!"
      redirect_back_or_default root_url
    else
      render :action => :new, :layout => "user"
    end
  end

  def edit
    @user = current_user
    render :layout => "application"
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "User profile updated!"
      redirect_to root_url
    else
      render :action => :edit, :layout => "application"
    end
  end

  def remove
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  #role management
  def index
    @users = User.paginate :page => params[:page],
      :per_page => 15,
      :order => sort_order('login')
  end

  #role management
  def privileges_edit
    @user = User.find(params[:id])
  end

  #role management
  def privileges_update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      update_roles(@user)
      redirect_to(users_path, :notice => 'Successfully updated privileged for the user.')
    else
       render :action => "privileges_edit"
    end
  end
  
  private
  def update_roles(user)
    # delete existing associations
    user.roles.delete_all

    #build an array of product objects from product ids posted by browser
    #selected_roles = user.role_list.nil? ? [] : user.role_list.keys.collect{|id| Role.find_by_id(id)}
    #add each of them
    #selected_roles.each { |role| user.roles << role}

      params.each do |key, value|
          if key =~ /(.*)_pri/
            if !value.blank?
              role = Role.find_by_id(value)
              @user.roles <<  role
            end
          end
      end
  end

end
