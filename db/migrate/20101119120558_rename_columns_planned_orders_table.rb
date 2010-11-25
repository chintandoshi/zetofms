class RenameColumnsPlannedOrdersTable < ActiveRecord::Migration
  def self.up
    rename_column :planned_orders, :entered_by, :created_by
    rename_column :planned_orders, :last_updated_by, :updated_by
    rename_column :planned_orders, :approved_on, :approved_at
  end

  def self.down
  end
end
