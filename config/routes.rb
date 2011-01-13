ActionController::Routing::Routes.draw do |map|

  # order module
  map.resources :orders, :member => { :lock => :get, :cancel => :delete, :close => :delete, :tooltip => :get} do |order|
     order.resources :planned_orders, :only => [:new, :create, :edit, :update],:member => { :lock => :get }
     order.resources :loaded_orders, :only => [:new, :create, :edit, :update], :member => { :lock => :get }
     order.resources :delivered_orders, :only => [:new,:create, :edit,:update], :member => { :lock => :get}
     order.resources :billed_orders, :only => [:new, :create, :edit, :update], :member => {:lock => :get}
     order.resources :detentions, :only => [:new, :create, :edit, :update, :destroy]
     order.resources :attachment_boxes, :only => [:index, :show, :create, :destroy]
  end
  #map.resources :order_statuses

  #contacts
  map.resources :consignees, :member => { :city_autocomplete => :get} do |consignee|
    consignee.resources :contacts, :only => [:new, :create, :edit, :update, :destroy]
  end
  map.resources :consignors, :member => { :city_autocomplete => :get} do |consignor|
    consignor.resources :contacts, :only => [:new, :create, :edit, :update, :destroy]
  end
  map.resources :custaccounts do |acc|
    acc.resources :contacts, :only => [:new, :create, :edit, :update, :destroy]
  end

  #drivers
  map.resources :drivers do |driver|
    driver.resources :attachment_boxes, :only => [:index, :show, :create, :destroy]
  end

  #vehicles
  map.resources :vehicles, :member => {:retire => :put}, :collection => {:retired => :get} do |vehicle|
    vehicle.resources :attachment_boxes, :only => [:index, :show, :create, :destroy]
  end

  #branches
  map.resources :branches

  #fuel module
  map.resources :petrol_pumps
  map.resources :fleet_cards
  map.resources :fuels, :member

  
  #admin
  map.resources :detention_reasons, :only => [:index, :create, :destroy]
  map.resources :product_units, :only => [:index, :create, :destroy]
  map.resources :product_types, :only => [:index, :create, :destroy]
  map.resources :order_status_types, :only => [:index, :create, :destroy]
  map.resources :roles, :only => [:index, :create, :destroy]
  map.resources :fuel_payment_types, :only => [:index, :create, :destroy]
  map.resources :makes, :only => [:index, :show, :create, :destroy] do |make|
      make.resources :vmodels, :only => [:create, :destroy]
  end

  #user management
  map.resources :user_sessions, :only => [:new, :create, :destroy]
  map.resources :users, :only => [:index, :new, :edit, :create, :update], :member => {:privileges_edit => :get , :privileges_update => :post, :remove => :get}
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.root :controller => "dashboard", :action => "index"
end
