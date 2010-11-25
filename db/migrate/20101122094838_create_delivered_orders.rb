class CreateDeliveredOrders < ActiveRecord::Migration
  def self.up
    create_table :delivered_orders do |t|
      t.integer :order_id
      t.datetime :delivery_date
      t.string :customer_ref_no
      t.integer :unloaded_quantity
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
    drop_table :delivered_orders
  end
end
