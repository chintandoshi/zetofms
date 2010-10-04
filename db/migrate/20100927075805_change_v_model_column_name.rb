class ChangeVModelColumnName < ActiveRecord::Migration
  def self.up
    rename_column :vehicles, :vehiclemodel_id, :vmodel_id
  end

  def self.down
    rename_column :vehicles, :vmodel_id, :vehiclemodel_id
  end
end
