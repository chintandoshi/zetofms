class RenameColumnsFuelTable < ActiveRecord::Migration
  def self.up
    rename_column :fuels, :pump_id, :petrol_pump_id
  end

  def self.down
  end
end
