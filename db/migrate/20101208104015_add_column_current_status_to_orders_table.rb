class AddColumnCurrentStatusToOrdersTable < ActiveRecord::Migration
  def self.up
    add_column :orders, :current_status_id, :integer
  end

  def self.down
  end
end
