class CreateLoadedOrders < ActiveRecord::Migration
  def self.up
    create_table :loaded_orders do |t|
      t.integer :order_id
      t.date :loading_date
      t.string :lorry_receipt_no
      t.integer :vehicle_id
      t.integer :loaded_quantity
      t.date :expected_delivery_date
      t.string :delivery_order_no
      t.string :bill_of_entry_no
      t.text :notes
      t.string :created_by
      t.string :updated_by
      t.string :approved_by
      t.datetime :approved_at
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :loaded_orders
  end
end
