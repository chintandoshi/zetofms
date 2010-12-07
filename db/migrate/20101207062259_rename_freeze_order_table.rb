class RenameFreezeOrderTable < ActiveRecord::Migration
  def self.up
    rename_column :orders, :freeze_at, :closed_at
    rename_column :orders, :freeze_by, :closed_by
    rename_column :orders, :close, :closed
  end

  def self.down
  end
end
