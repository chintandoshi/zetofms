class AddDisabledToVModel < ActiveRecord::Migration
  def self.up
    add_column :vmodels, :disabled_at, :datetime
  end

  def self.down
  end
end
