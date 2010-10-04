module VehiclesHelper
    def populate_combo_with_vehiclemodels
     @vehiclemodels_ui = Vmodel.find(:all).map {|vmodel|
                             [vmodel.model_name + "(" + vmodel.make.make_name + ")", vmodel.id ]}
    end

    def populate_combo_with_vehiclemakes
     @vehiclemodels_ui = Make.find(:all).map {|make|
                             [make.make_name, make.id ]}
    end


    def populate_combo_with_products
      @products_ui = ProductType.find(:all)
    end
end
