# To change this template, choose Tools | Templates
# and open the template in the editor.

authorization do

  #orders
  role :ordersrestricted do
    includes :guest
    has_permission_on [:orders], :to => [:index, :show]
  end

  role :ordersoperator do
    includes :ordersrestricted
    has_permission_on [:orders, :planned_orders, :loaded_orders, :delivered_orders, :billed_orders, :detentions], :to => [:new, :create, :edit, :update]
  end

  role :orderssuper do
    includes :ordersoperator
    has_permission_on [:orders, :planned_orders, :loaded_orders, :delivered_orders, :billed_orders, :detentions], :to => [:lock, :destroy, :close]
  end

  #drivers
  role :driverssuper do
    includes :driversoperator
    has_permission_on [:drivers], :to => [:destroy]
  end

  role :driversoperator do
    includes :driversrestricted
    has_permission_on [:drivers], :to => [:new, :edit, :create, :update, :attachments]
  end

  role :driversrestricted do
    includes :guest
    has_permission_on [:drivers], :to => [:index, :show]
  end

  #vehicles
  role :vehiclessuper do
    includes :vehiclesoperator
    has_permission_on [:vehicles], :to => [:destroy]
  end

  role :vehiclesoperator do
    includes :vehiclesrestricted
    has_permission_on [:vehicles], :to => [:new, :edit, :create, :update, :attachments]
  end

  role :vehiclesrestricted do
    includes :guest
    has_permission_on [:vehicles], :to => [:index, :show]
  end

  #contacts
  role :contactsoperator do
    includes :guest
    has_permission_on [:contacts], :to => [:new, :create, :edit, :update]
  end

  role :contactssuper do
    includes :contactsoperator
    has_permission_on [:contacts], :to => [:destroy]
  end

  #custaccounts
  role :custaccountssuper do
    includes :custaccountsoperator
    has_permission_on [:custaccounts], :to => [:destroy]
  end

  role :custaccountsoperator do
    includes :custaccountsrestricted
    has_permission_on [:custaccounts], :to => [:new, :edit, :create, :update]
  end

  role :custaccountsrestricted do
    includes :guest
    has_permission_on [:custaccounts], :to => [:index, :show]
  end

  #consignors
  role :consignorssuper do
    includes :consignorsoperator
    has_permission_on [:consignors], :to => [:destroy]
  end

  role :consignorsoperator do
    includes :consignorsrestricted
    has_permission_on [:consignors], :to => [:new, :edit, :create, :update]
  end

  role :consignorsrestricted do
    includes :guest
    has_permission_on [:consignors], :to => [:index, :show]
  end

  #consignees
  role :consigneessuper do
    includes :consigneesoperator
    has_permission_on [:consignees], :to => [:destroy]
  end

  role :consigneesoperator do
    includes :consigneesrestricted
    has_permission_on [:consignees], :to => [:new, :edit, :create, :update]
  end

  role :consigneesrestricted do
    includes :guest
    has_permission_on [:consignees], :to => [:index, :show]
  end

  #admin
  role :useradmin do
    includes :masteradmin
    has_permission_on [:users], :to => [:index, :privileges_edit, :privileges_update, :remove]
  end

  role :masteradmin do
    includes :guest
    has_permission_on [:makes, :vmodels, :detention_reasons, :product_units, :product_types, :order_status_types, :roles], :to => [:index, :show, :create, :destroy]
  end


  #default role
  role :guest do
    has_permission_on [:dashboard], :to => [:index]
  end

end
