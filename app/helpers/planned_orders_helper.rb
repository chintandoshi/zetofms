module PlannedOrdersHelper
    def populate_combo_with_vehiclelist
     @vehicle_list = Vehicle.active.find(:all).map {|vehicle|
                             [vehicle.registration_number, vehicle.id ]}
    end
    
end
