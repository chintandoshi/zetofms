class AddColumnOrdersTable < ActiveRecord::Migration
  def self.up
        add_column :orders, :cancelled, :string
        add_column :orders, :cancelled_at, :datetime
        add_column :orders, :cancelled_by, :string
        change_column :orders, :approved_at, :datetime
  end

  def self.down
  end
end
