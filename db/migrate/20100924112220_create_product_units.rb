class CreateProductUnits < ActiveRecord::Migration
  def self.up
    create_table :product_units do |t|
      t.string :product_unit_name

      t.timestamps
    end
  end

  def self.down
    drop_table :product_units
  end
end
