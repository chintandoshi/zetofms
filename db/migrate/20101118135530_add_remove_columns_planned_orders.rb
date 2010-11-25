class AddRemoveColumnsPlannedOrders < ActiveRecord::Migration
  def self.up
    remove_column :planned_orders, :entered_on
    remove_column :planned_orders, :last_updated_on
    add_column :planned_orders, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :planned_orders, :approved
  end
end

