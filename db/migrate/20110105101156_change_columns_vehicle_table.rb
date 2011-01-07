class ChangeColumnsVehicleTable < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :retired_at, :datetime
    remove_column :vmodels, :disabled_at
  end

  def self.down
  end
end
