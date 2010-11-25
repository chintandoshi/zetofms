class RenameConsigneeColumn < ActiveRecord::Migration
  def self.up
    rename_column :orders, :consigee_id, :consignee_id
  end

  def self.down
    rename_column :orders, :consignee_id, :consigee_id
  end
end
