module OrdersHelper

    ################################
    #comboboxes#
    def populate_combo_with_customerlist
     @customer_list = Custaccount.find(:all).map {|customer|
                             [customer.display_name, customer.id ]}
    end

    def populate_combo_with_customercontacts(id)
      @customer_list = Custaccount.find_by_id(id).contacts.map {|contact|
                             [contact.display_name, contact.id ]}
    end


    def populate_combo_with_consignorlist
     @consignor_list = Consignor.find(:all).map {|consignor|
                             [consignor.display_name, consignor.id ]}
    end

    def populate_combo_with_consigneelist
     @consignee_list = Consignee.find(:all).map {|consignee|
                             [consignee.display_name, consignee.id ]}
    end

    def populate_combo_with_productlist
     @product_list = ProductType.find(:all).map {|product|
                             [product.product_type_name, product.id ]}
    end

    def populate_combo_with_productunit
     @productunit_list = ProductUnit.find(:all).map {|productunit|
                             [productunit.product_unit_name, productunit.id ]}
    end


  end
