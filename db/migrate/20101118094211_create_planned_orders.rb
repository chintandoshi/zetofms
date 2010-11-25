class CreatePlannedOrders < ActiveRecord::Migration
  def self.up
    create_table :planned_orders do |t|
      t.integer :order_id
      t.date :dispatch_date_planned
      t.date :delivery_date_planned
      t.integer :vehicle_id
      t.text :notes
      t.string :entered_by
      t.datetime :entered_on
      t.string :last_updated_by
      t.datetime :last_updated_on
      t.string :approved_by
      t.datetime :approved_on

      t.timestamps
    end
  end

  def self.down
    drop_table :planned_orders
  end
end
