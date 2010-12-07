class AddColumnFreezeOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :freeze, :boolean, :default => false
    add_column :orders, :freeze_at, :datetime
    add_column :orders, :freeze_by, :string
  end

  def self.down
  end
end
