module FuelsHelper
    def populate_combo_with_vehiclelist
     @vehicle_list = Vehicle.active.find(:all).map {|vehicle|
                             [vehicle.registration_number, vehicle.id ]}
    end
    def populate_combo_with_branchlist
     @branch_list = Branch.find(:all).map {|branch|
                             [branch.name, branch.id ]}
    end
    def populate_combo_with_pumplist
     @pumplist_list = PetrolPump.find(:all).map {|pump|
                             [pump.name, pump.id ]}
    end
    def populate_combo_with_fuelpaymentlist
     @fuelpayment_list = FuelPaymentType.find(:all).map {|payment|
                             [payment.name, payment.id ]}
    end
    def populate_combo_with_fleetcardlist
     @fleetcard_list = FleetCard.find(:all).map {|fleetcard|
                             [fleetcard.name, fleetcard.id ]}
    end
end
