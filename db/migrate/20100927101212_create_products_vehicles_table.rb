class CreateProductsVehiclesTable < ActiveRecord::Migration
  def self.up
      create_table :product_types_vehicles, :id => false do |t|
          t.integer :product_type_id
          t.integer :vehicle_id
      end

      add_index :product_types_vehicles, [:product_type_id, :vehicle_id], :unique => true
      add_index :product_types_vehicles, :vehicle_id, :unique => false
   end

  def self.down
    drop_table :products_types_vehicles
  end
end
