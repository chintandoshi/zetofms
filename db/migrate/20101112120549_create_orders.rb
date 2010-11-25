class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :custaccount_id
      t.integer :billingcontact_id
      t.integer :purchasecontact_id
      t.datetime :placement_date_time
      t.string :placement_mode
      t.integer :consignor_id
      t.integer :consigee_id
      t.string :from
      t.string :to
      t.integer :product_type_id
      t.integer :product_unit_id
      t.integer :quantity
      t.integer :delorder_number
      t.date :dispatch_date_requested
      t.date :delivery_date_requested
      t.text :notes1
      t.text :notes2

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
