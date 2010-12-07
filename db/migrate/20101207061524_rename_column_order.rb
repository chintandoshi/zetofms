class RenameColumnOrder < ActiveRecord::Migration
  def self.up
    rename_column :orders, :freeze, :close
  end

  def self.down
  end
end
